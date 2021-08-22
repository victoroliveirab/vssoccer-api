defmodule VssoccerApiWeb.MatchView do
  use VssoccerApiWeb, :view

  def render("index.json", %{matches: matches}) do
    matches
  end

  def render("show.json", %{match: match}) do
    match
  end

  def render("400.json", _) do
    %{errors: %{detail: "You need to pass at least one valid filter to view this resource"}}
  end
end
