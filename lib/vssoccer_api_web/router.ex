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
    resources "/teams", TeamController, only: [:index, :show]
    resources "/profiles", ProfileController, only: [:create, :show]
    resources "/matches", MatchController, only: [:index, :show]

    patch "/profiles/:profile_id/teams/:team_id", ProfileController, :profile_team
  end
end
