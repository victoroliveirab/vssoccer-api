defmodule VssoccerApiWeb.UserController do
  use VssoccerApiWeb, :controller

  import VssoccerApiWeb.Authorize

  alias Phauxth.Log
  alias VssoccerApi.Accounts

  action_fallback VssoccerApiWeb.FallbackController

  # the following plugs are defined in the controllers/authorize.ex file
  plug :id_check when action in [:show, :update, :delete]

  def create(conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.create_user(user_params) do
      Log.info(%Log{user: user.id, message: "user created"})
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(%Plug.Conn{assigns: %{current_user: user}} = conn, _params) do
    render(conn, "show.json", user: user)
  end

  def update(%Plug.Conn{assigns: %{current_user: user}} = conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(%Plug.Conn{assigns: %{current_user: user}} = conn, _) do
    {:ok, _user} = Accounts.delete_user(user)
    send_resp(conn, :no_content, "")
  end
end
