defmodule VssoccerApi.Repo.Migrations.CreateMatchesTable do
  use Ecto.Migration

  def change do
    create table(:matches) do
      add :api_id, :integer
      add :home_team_id, references(:teams, on_delete: :nothing)
      add :away_team_id, references(:teams, on_delete: :nothing)
      add :competition_id, references(:competitions, on_delete: :nothing)
      add :home_goals, :integer
      add :away_goals, :integer
      add :et_home_goals, :integer
      add :et_away_goals, :integer
      add :pen_home_goals, :integer
      add :pen_away_goals, :integer
      add :description, :string
      add :match_time, :utc_datetime
      add :status, :string
      add :elapsed, :integer

      timestamps()
    end

    create unique_index(:matches, [:api_id])
    create index(:matches, [:home_team_id])
    create index(:matches, [:away_team_id])
  end
end
