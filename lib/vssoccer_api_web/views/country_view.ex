defmodule VssoccerApiWeb.CountryView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.CountryView

  def render("index.json", %{countries: countries}) do
    render_many(countries, CountryView, "show.json")
  end

  def render("show.json", %{country: country}) do
    country
  end
end
