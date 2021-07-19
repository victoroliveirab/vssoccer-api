defmodule VssoccerApiWeb.Router do
  use VssoccerApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Phauxth.AuthenticateToken
  end

  scope "/api", VssoccerApiWeb do
    pipe_through :api

    post "/sessions", SessionController, :create
    resources "/users", UserController, except: [:new, :edit, :index]
    resources "/countries", CountryController, only: [:index, :show]
    resources "/competitions", CompetitionController, only: [:index, :show]
  end
end
