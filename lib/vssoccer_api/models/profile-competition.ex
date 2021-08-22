defmodule VssoccerApi.Models.ProfileCompetition do
  @moduledoc """
  Model ProfileCompetition
  """
  use Ecto.Schema

  import Ecto.Changeset

  @require_params [:profile_id, :competition_id]

  @type t :: %__MODULE__{
    profile_id: integer,
    competition_id: integer,
    inserted_at: DateTime.t(),
    updated_at: DateTime.t(),
  }

  @primary_key false
  schema "profiles_competitions" do
    field :profile_id, :id
    field :competition_id, :id

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @require_params)
    |> validate_required(@require_params)
  end
end
