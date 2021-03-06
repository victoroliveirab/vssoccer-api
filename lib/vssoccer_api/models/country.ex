defmodule VssoccerApi.Models.Country do
  @moduledoc """
  Model Country.
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Models.{Competition, Profile}

  @required_params [:name]

  @derive {Jason.Encoder, only: [:id, :name, :flag]}

  @type t :: %__MODULE__{
    id: integer,
    name: String.t(),
    flag: String.t() | nil,
    competitions: [Competition.t()] | %Ecto.Association.NotLoaded{},
    profiles: [Profile.t()] | %Ecto.Association.NotLoaded{},
  }

  schema "countries" do
    field :name, :string
    field :flag, :string

    has_many :competitions, Competition, on_delete: :delete_all
    has_many :profiles, Profile
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end

end
