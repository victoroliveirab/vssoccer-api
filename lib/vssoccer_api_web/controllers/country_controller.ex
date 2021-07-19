defmodule VssoccerApiWeb.CountryController do
  use VssoccerApiWeb, :controller

  import VssoccerApiWeb.Authorize

  alias VssoccerApi.Actions.Countries

  action_fallback VssoccerApiWeb.FallbackController

  # the following plug is defined in the controllers/authorize.ex file
  plug :logged_check when action in [:index, :show]

  def index(conn, _) do
    countries = Countries.list_countries()
    render(conn, "index.json", countries: countries)
  end

  def show(conn, %{"id" => id}) do
    country = Countries.get_country(id)
    render(conn, "show.json", country: country)
  end

end
