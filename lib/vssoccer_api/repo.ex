defmodule VssoccerApi.Repo do
  use Ecto.Repo,
    otp_app: :vssoccer_api,
    adapter: Ecto.Adapters.Postgres
end
