defmodule VssoccerApi.Repo.Migrations.CreateProfileCompetitionTable do
  use Ecto.Migration

  def change do
    create table(:profiles_competitions, primary_key: false) do
      add :profile_id, references(:profiles, on_delete: :nothing), primary_key: true
      add :competition_id, references(:competitions, on_delete: :nothing), primary_key: true

      timestamps()
    end

    create index(:profiles_competitions, [:profile_id])
    create index(:profiles_competitions, [:competition_id])
  end
end
