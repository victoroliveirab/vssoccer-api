defmodule VssoccerApi.Repo.Migrations.CreateProfilesTable do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :country_id, references(:countries)

      timestamps()
    end

    create unique_index :profiles, [:user_id]
  end

end
