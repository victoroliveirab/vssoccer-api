defmodule VssoccerApi.Models.Team do
  @moduledoc """
  Model Team.
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Models.{Profile, ProfileTeam}

  @required_params [:api_id, :name]

  @derive {Jason.Encoder, only: [:id, :name, :logo]}

  @type t :: %__MODULE__{
    id: integer,
    api_id: integer,
    name: String.t(),
    logo: String.t() | nil,
    profiles: [Profile.t()] | %Ecto.Association.NotLoaded{}
  }

  schema "teams" do
    field :api_id, :integer
    field :name, :string
    field :logo, :string

    many_to_many :profiles, Profile, join_through: ProfileTeam
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:api_id])
  end

end
