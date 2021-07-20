defmodule VssoccerApiWeb.ProfileController do
  use VssoccerApiWeb, :controller

  import VssoccerApiWeb.Authorize

  alias VssoccerApi.Actions.{Profiles, ProfilesTeams}

  action_fallback VssoccerApiWeb.FallbackController

  # the following plug is defined in the controllers/authorize.ex file
  plug :logged_check when action in [:create, :show]

  def create(conn, params) do
    with {:ok, profile} <- Profiles.create(params) do
      conn
      |> put_status(:created)
      |> render("create.json", profile: profile)
    end
  end

  def show(conn, %{"id" => id}) do
    profile = Profiles.get_profile(id)
    render(conn, "show.json", profile: profile)
  end

  def profile_team(conn, params) do
    case ProfilesTeams.get_by(params) do
      nil -> add_team(conn, params)
      res -> remove_team(conn, res)
    end
  end

  def add_team(conn, params) do
    with {:ok, %{profile_id: id}} <- ProfilesTeams.create(params) do
      show(conn, %{"id" => id})
    end
  end

  def remove_team(conn, %{profile_id: id} = params) do
    with {:ok, nil} <- ProfilesTeams.delete(params) do
      show(conn, %{"id" => id})
    end
  end

end
