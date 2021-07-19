defmodule VssoccerApiWeb.TeamController do
  use VssoccerApiWeb, :controller

  import VssoccerApiWeb.Authorize

  alias VssoccerApi.Actions.Teams

  action_fallback VssoccerApiWeb.FallbackController

  # the following plug is defined in the controllers/authorize.ex file
  plug :logged_check when action in [:index, :show]

  def index(conn, _) do
    teams = Teams.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def show(conn, %{"id" => id}) do
    team = Teams.get_team(id)
    render(conn, "show.json", team: team)
  end

end
