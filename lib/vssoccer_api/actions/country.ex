defmodule VssoccerApi.Actions.Countries do
  @moduledoc """
  Countries' context.
  """

  alias VssoccerApi.{Models.Country, Repo}

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @doc """
  Returns a list of countries for the user.
  """
  @spec list_countries() :: [Country.t()]
  def list_countries, do: Repo.all(Country)

  @doc """
  Gets a single country by id.
  """
  @spec get_country(integer) :: Country.t() | nil
  def get_country(id), do: Repo.get(Country, id)

end
