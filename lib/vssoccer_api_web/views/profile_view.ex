defmodule VssoccerApiWeb.ProfileView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.ProfileView

  def render("create.json", %{profile: profile}) do
    render_one(profile, ProfileView, "show.json")
  end

  def render("show.json", %{profile: profile}) do
    profile
  end

  def render("show_simplified.json", %{profile: profile}) do
    %{id: profile.id}
  end
end
