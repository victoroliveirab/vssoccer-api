defmodule VssoccerApiWeb.AuthTestHelpers do
  use Phoenix.ConnTest

  alias VssoccerApi.Actions.{Sessions, Users}
  alias VssoccerApiWeb.Auth.Token

  def add_user(email) do
    user = %{email: email, password: "reallyHard2gue$$"}
    {:ok, user} = Users.create(user)
    user
  end

  def add_token_conn(conn, user) do
    {:ok, %{id: session_id}} = Sessions.create_session(%{user_id: user.id})
    user_token = Token.sign(%{"session_id" => session_id})

    conn
    |> put_req_header("accept", "application/json")
    |> put_req_header("authorization", user_token)
  end
end
