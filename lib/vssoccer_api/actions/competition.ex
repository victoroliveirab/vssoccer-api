defmodule VssoccerApi.Actions.Competitions do
  @moduledoc """
  Competitions' context.
  """

  alias VssoccerApi.{Models.Competition, Repo}

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @doc """
  Returns a list of competitions for the user.
  """
  @spec list_competitions() :: [Competition.t()]
  def list_competitions, do: Repo.all(Competition)

  @doc """
  Gets a single Competition by id.
  """
  @spec get_competition(integer) :: Competition.t() | nil
  def get_competition(id), do: Repo.get(Competition, id)

end
