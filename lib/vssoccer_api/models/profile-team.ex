defmodule VssoccerApi.Models.ProfileTeam do
  @moduledoc """
  Model ProfileTeam.
  """
  use Ecto.Schema

  import Ecto.Changeset

  @required_params [:profile_id, :team_id]

  @type t :: %__MODULE__{
    profile_id: integer,
    team_id: integer,
    inserted_at: DateTime.t(),
    updated_at: DateTime.t(),
  }

  @primary_key false
  schema "profiles_teams" do
    field :profile_id, :id
    field :team_id, :id

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end

end
