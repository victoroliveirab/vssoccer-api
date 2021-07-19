defmodule VssoccerApiWeb.TeamView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.TeamView

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, TeamView, "show.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: team}
  end
end
