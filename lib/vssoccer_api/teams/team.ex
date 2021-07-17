defmodule VssoccerApi.Teams.Team do
  use Ecto.Schema

  import Ecto.Changeset

  @required_params [:api_id, :name]

  schema "teams" do
    field :api_id, :integer
    field :name, :string
    field :logo, :string
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:api_id])
  end

end
