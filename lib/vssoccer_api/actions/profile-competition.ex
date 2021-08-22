defmodule VssoccerApi.Actions.ProfilesCompetitions do
  @moduledoc """
  Profiles' context.
  """

  import Ecto.Query

  alias VssoccerApi.{Models.ProfileCompetition, Repo}

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @doc """
  Creates an association of profile and team for the user.
  """
  @spec create(map) :: {:ok, ProfileCompetition.t()} | changeset_error
  def create(attrs) do
    attrs
    |> ProfileCompetition.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  @spec delete(ProfileCompetition.t()) :: {:ok, nil} | changeset_error
  def delete(%{profile_id: profile_id, competition_id: competition_id}) do
    from(
      r in ProfileCompetition,
      where: r.profile_id == ^profile_id and r.competition_id == ^competition_id
    ) |> Repo.delete_all()
    {:ok, nil}
  end

  # TODO: refactor these 3 functions

  def get_by(%{"profile_id" => profile_id, "competition_id" => competition_id}) do
    Repo.get_by(ProfileCompetition, profile_id: profile_id, competition_id: competition_id)
  end

  def get_by(%{"profile_id" => profile_id}) do
    Repo.get_by(ProfileCompetition, profile_id: profile_id)
  end

  def get_by(%{"competition_id" => competition_id}) do
    Repo.get_by(ProfileCompetition, competition_id: competition_id)
  end

  defp handle_insert({:ok, %ProfileCompetition{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}

end
