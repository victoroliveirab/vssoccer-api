defmodule VssoccerApi.Models.Team do
  @moduledoc """
  Model Team.
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Models.Profile

  @required_params [:api_id, :name]

  schema "teams" do
    field :api_id, :integer
    field :name, :string
    field :logo, :string

    belongs_to :profile, Profile
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:api_id])
  end

end
