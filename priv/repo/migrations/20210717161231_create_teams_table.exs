defmodule VssoccerApi.Repo.Migrations.CreateTeamsTable do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :api_id, :integer
      add :name, :string
      add :logo, :string
    end

    create unique_index :teams, [:api_id]
  end
end
