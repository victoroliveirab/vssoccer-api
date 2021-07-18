defmodule VssoccerApi.Models.Competition do
  @moduledoc """
  Model Competition.
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Models.Country

  @required_params [:api_id, :name, :country_id]

  @type t :: %__MODULE__{
    id: integer,
    api_id: integer,
    name: String.t(),
    logo: String.t() | nil,
    country_id: integer,
    country: Country.t() | %Ecto.Association.NotLoaded{}
  }

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
