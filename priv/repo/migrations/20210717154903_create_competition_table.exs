defmodule VssoccerApi.Repo.Migrations.CreateCompetitionTable do
  use Ecto.Migration

  def change do
    create table(:competitions) do
      add :api_id, :integer
      add :name, :string
      add :logo, :string
      add :country_id, references(:countries, on_delete: :delete_all)
    end

    create unique_index :competitions, [:api_id]
  end
end
