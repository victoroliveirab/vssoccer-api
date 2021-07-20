defmodule VssoccerApi.Repo.Migrations.CreateProfileTeamTable do
  use Ecto.Migration

  def change do
    create table(:profiles_teams, primary_key: false) do
      add :profile_id, references(:profiles, on_delete: :nothing), primary_key: true
      add :team_id, references(:teams, on_delete: :nothing), primary_key: true

      timestamps()
    end

    create index(:profiles_teams, [:profile_id])
    create index(:profiles_teams, [:team_id])
  end
end
