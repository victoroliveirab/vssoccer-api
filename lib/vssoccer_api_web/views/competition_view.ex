defmodule VssoccerApiWeb.CompetitionView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.CompetitionView

  def render("index.json", %{competitions: competitions}) do
    render_many(competitions, CompetitionView, "show.json")
  end

  def render("show.json", %{competition: competition}) do
    competition
  end
end
