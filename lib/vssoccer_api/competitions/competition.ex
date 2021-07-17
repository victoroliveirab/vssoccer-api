defmodule VssoccerApi.Competitions.Competition do
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Countries.Country

  @required_params [:api_id, :name, :country_id]

  schema "competitions" do
    field :api_id, :integer
    field :name, :string
    field :logo, :string

    belongs_to :country, Country
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:api_id])
  end

end
