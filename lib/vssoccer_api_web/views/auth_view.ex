defmodule VssoccerApiWeb.AuthView do
  use VssoccerApiWeb, :view

  def render("401.json", _assigns) do
    %{errors: %{detail: "You need to login to view this resource"}}
  end

  def render("403.json", _assigns) do
    %{errors: %{detail: "You are not authorized to view this resource"}}
  end

  def render("logged_in.json", _assigns) do
    %{errors: %{detail: "You are already logged in"}}
  end

  def render("invalid_login.json", _assigns) do
    %{errors: %{detail: "Wrong username and/or password"}}
  end
end
