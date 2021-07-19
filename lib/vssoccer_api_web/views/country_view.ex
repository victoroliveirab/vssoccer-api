defmodule VssoccerApiWeb.CountryView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.CountryView

  def render("index.json", %{countries: countries}) do
    %{data: render_many(countries, CountryView, "show.json")}
  end

  def render("show.json", %{country: country}) do
    %{data: country}
  end
end
