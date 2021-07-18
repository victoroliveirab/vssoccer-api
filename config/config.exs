# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vssoccer_api,
  ecto_repos: [VssoccerApi.Repo]

# Configures the endpoint
config :vssoccer_api, VssoccerApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vMy3CJZl0H73T07aLm5kIROhfxqqb03kLU9zFBQjGBr+TaWBIbxOf2jx+L9Scj0f",
  render_errors: [view: VssoccerApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: VssoccerApi.PubSub,
  live_view: [signing_salt: "n0Sef6tw"]

# Phauxth authentication configuration
config :phauxth,
  user_context: VssoccerApi.Actions.Users,
  crypto_module: Argon2,
  token_module: VssoccerApiWeb.Auth.Token

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
