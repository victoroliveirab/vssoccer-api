defmodule VssoccerApi.Profiles.Profile do
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Accounts.User
  alias VssoccerApi.Teams.Team
  alias VssoccerApi.Countries.Country

  schema "profiles" do
    belongs_to :user, User
    belongs_to :country, Country
    has_many :teams, Team
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end

end
