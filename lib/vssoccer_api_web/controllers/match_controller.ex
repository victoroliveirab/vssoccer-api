defmodule VssoccerApiWeb.MatchController do
  use VssoccerApiWeb, :controller

  import VssoccerApiWeb.{Authorize, Match}

  alias VssoccerApi.Actions.Matches

  action_fallback VssoccerApiWeb.FallbackController

  # the following plug is defined in the controllers/authorize.ex file
  plug :logged_check when action in [:index, :show]
  plug :valid_filters, ~w(date competition_id team_id) when action in [:index]

  def index(%Plug.Conn{assigns: %{filters: filters}} = conn, _params) do
    matches = Matches.list_matches(filters)
    render(conn, "index.json", matches: matches)
  end

  def show(conn, %{"id" => id}) do
    match = Matches.get_match(id)
    render(conn, "show.json", match: match)
  end

end
