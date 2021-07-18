defmodule VssoccerApi.Models.Profile do
  @moduledoc """
  Model Profile.
  """
  use Ecto.Schema

  alias VssoccerApi.Models.{Country, Team, User}

  @type t :: %__MODULE__{
    id: integer,
    user_id: integer,
    user: User.t() | %Ecto.Association.NotLoaded{},
    country_id: integer,
    country: Country.t() | %Ecto.Association.NotLoaded{},
    teams: [Team.t()] | %Ecto.Association.NotLoaded{},
    inserted_at: DateTime.t(),
    updated_at: DateTime.t(),
  }

  schema "profiles" do
    belongs_to :user, User
    belongs_to :country, Country
    has_many :teams, Team

    timestamps()
  end

end
