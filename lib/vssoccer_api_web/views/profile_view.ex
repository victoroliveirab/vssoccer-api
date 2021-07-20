defmodule VssoccerApiWeb.ProfileView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.ProfileView

  def render("create.json", %{profile: profile}) do
    render_one(profile, ProfileView, "show.json")
  end

  def render("show.json", %{profile: profile}) do
    %{data: profile}
  end
end
