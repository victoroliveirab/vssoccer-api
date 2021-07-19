defmodule VssoccerApiWeb.CompetitionController do
  use VssoccerApiWeb, :controller

  import VssoccerApiWeb.Authorize

  alias VssoccerApi.Actions.Competitions

  action_fallback VssoccerApiWeb.FallbackController

  # the following plug is defined in the controllers/authorize.ex file
  plug :logged_check when action in [:index, :show]

  def index(conn, _) do
    competitions = Competitions.list_competitions()
    render(conn, "index.json", competitions: competitions)
  end

  def show(conn, %{"id" => id}) do
    competition = Competitions.get_competition(id)
    render(conn, "show.json", competition: competition)
  end

end
