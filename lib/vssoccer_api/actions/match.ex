defmodule VssoccerApi.Actions.Matches do
  @moduledoc """
  Matches' context.
  """

  import Ecto.Query, warn: false
  require Date

  alias VssoccerApi.Models.Match
  alias VssoccerApi.Repo

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @midnight ~T[00:00:00.0]

  @doc """
  Returns a list of matches for the user.
  """
  @spec list_matches(map) :: [Match.t()]
  def list_matches(filters) do
    Match
    |> query_by_filters(filters)
    |> Repo.all
  end

  @doc """
  Gets a single match by id.
  """
  def get_match(id), do: Repo.get(Match, id)

  defp query_by_filters(query, params) do
    # TODO: find out why capture operator is not working here
    Enum.reduce(params, query, fn (tup, query) -> query_by(query, tup) end)
  end

  defp query_by(query, {"date", date}) do
    date_time = date |> Date.from_iso8601!() |> DateTime.new!(@midnight)
    from(m in query, where: m.match_time >= ^date_time)
  end

  defp query_by(query, {key, value}) do
    atom_key = String.to_atom(key)
    from(p in query, where: field(p, ^atom_key) == ^value)
  end
end
