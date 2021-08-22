defmodule VssoccerApiWeb.UserView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.{ProfileView, UserView}

  def render("show.json", %{user: user, profile: profile}) do
    user_render = render_one(user, UserView, "user.json")
    profile_render = render_one(profile, ProfileView, "show_simplified.json")
    %{user: user_render, profile: profile_render}
  end

  def render("show.json", %{user: user}) do
    %{user: user}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email}
  end
end
