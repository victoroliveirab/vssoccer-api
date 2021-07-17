defmodule VssoccerApiWeb.SessionView do
  use VssoccerApiWeb, :view

  def render("info.json", %{info: token}) do
    %{access_token: token}
  end
end
