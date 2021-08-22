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

  defp query_by(query, {"team_id", teams_ids}) when is_list(teams_ids) do
    from(p in query, where: field(p, :home_team_id) in ^teams_ids or field(p, :away_team_id) in ^teams_ids)
  end

  defp query_by(query, {"team_id", team_id}), do: query_by(query, {"team_id", [team_id]})

  defp query_by(query, {key, values}) when is_list(values) do
    atom_key = String.to_atom(key)
    from(p in query, where: field(p, ^atom_key) in ^values)
  end

  defp query_by(query, {key, value}), do: query_by(query, {key, [value]})
end
