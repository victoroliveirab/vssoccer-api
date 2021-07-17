defmodule VssoccerApi.Countries.Country do
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Competitions.Competition

  @required_params [:name]

  schema "countries" do
    field :name, :string
    field :flag, :string
    has_many :competitions, Competition, on_delete: :delete_all
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end

end
