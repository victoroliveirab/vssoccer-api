defmodule VssoccerApi.Repo.Migrations.CreateCountriesTable do
  use Ecto.Migration

  def change do
    create table (:countries) do
      add :name, :string
      add :flag, :string
    end
  end
end
