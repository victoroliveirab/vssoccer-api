defmodule VssoccerApiWeb.UserView do
  use VssoccerApiWeb, :view
  alias VssoccerApiWeb.UserView

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email}
  end
end
