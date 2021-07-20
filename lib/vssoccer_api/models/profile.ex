defmodule VssoccerApi.Models.Profile do
  @moduledoc """
  Model Profile.
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Models.{Country, ProfileTeam, Team, User}

  @required_params [:user_id, :country_id]

  @derive {Jason.Encoder, only: [:id, :teams | @required_params]}

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
    many_to_many :teams, Team, join_through: ProfileTeam

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(@required_params)
  end

end
