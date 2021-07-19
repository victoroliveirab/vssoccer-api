defmodule VssoccerApi.Actions.Teams do
  @moduledoc """
  Teams' context.
  """

  alias VssoccerApi.{Models.Team, Repo}

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @doc """
  Returns a list of teams for the user.
  """
  @spec list_teams() :: [Team.t()]
  def list_teams, do: Repo.all(Team)

  @doc """
  Gets a single team by id.
  """
  @spec get_team(integer) :: Team.t() | nil
  def get_team(id), do: Repo.get(Team, id)

end
