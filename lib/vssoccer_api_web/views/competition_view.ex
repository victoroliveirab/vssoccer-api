defmodule VssoccerApiWeb.CompetitionView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.CompetitionView

  def render("index.json", %{competitions: competitions}) do
    %{data: render_many(competitions, CompetitionView, "show.json")}
  end

  def render("show.json", %{competition: competition}) do
    %{data: competition}
  end
end
