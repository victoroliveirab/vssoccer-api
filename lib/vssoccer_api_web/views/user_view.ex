defmodule VssoccerApiWeb.UserView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.UserView

  def render("show.json", %{user: user, profile: profile}) do
    %{user: render_one(user, UserView, "user.json"), profile: profile}
  end

  def render("show.json", %{user: user}) do
    %{user: user}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email}
  end
end
