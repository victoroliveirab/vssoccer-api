defmodule VssoccerApi.Actions.Profiles do
  @moduledoc """
  Profiles' context.
  """
  import Ecto.Query

  alias VssoccerApi.{Models.Profile, Repo}

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @doc """
  Creates a Profile for the user.
  """
  @spec create(map) :: {:ok, Profile.t()} | changeset_error
  def create(attrs) do
    attrs
    |> Profile.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  @doc """
  Gets a single Profile by id.
  """
  @spec get_profile(integer) :: Profile.t() | nil
  def get_profile(id), do: Profile |> preload(:teams) |> Repo.get(id)

  defp handle_insert({:ok, %Profile{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}

end
