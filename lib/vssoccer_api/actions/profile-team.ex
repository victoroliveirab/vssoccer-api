defmodule VssoccerApi.Actions.ProfilesTeams do
  @moduledoc """
  Profiles' context.
  """

  import Ecto.Query

  alias VssoccerApi.{Models.ProfileTeam, Repo}

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @doc """
  Creates an association of profile and team for the user.
  """
  @spec create(map) :: {:ok, ProfileTeam.t()} | changeset_error
  def create(attrs) do
    attrs
    |> ProfileTeam.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  @spec delete(ProfileTeam.t()) :: {:ok, nil} | changeset_error
  def delete(%{profile_id: profile_id, team_id: team_id}) do
    from(
      r in ProfileTeam,
      where: r.profile_id == ^profile_id and r.team_id == ^team_id
    ) |> Repo.delete_all()
    {:ok, nil}
  end

  # TODO: refactor these 3 functions

  def get_by(%{"profile_id" => profile_id, "team_id" => team_id}) do
    Repo.get_by(ProfileTeam, profile_id: profile_id, team_id: team_id)
  end

  def get_by(%{"profile_id" => profile_id}) do
    Repo.get_by(ProfileTeam, profile_id: profile_id)
  end

  def get_by(%{"team_id" => team_id}) do
    Repo.get_by(ProfileTeam, team_id: team_id)
  end

  defp handle_insert({:ok, %ProfileTeam{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}

end
