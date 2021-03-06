defmodule VssoccerApi.Actions.Users do
  @moduledoc """
  Users' context.
  """

  import Ecto.Query, warn: false

  alias VssoccerApi.Actions.Sessions
  alias VssoccerApi.Models.{Session, User}
  alias VssoccerApi.Repo

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @doc """
  Returns the list of users.
  """
  @spec list() :: [User.t()]
  def list, do: Repo.all(User)

  @doc """
  Gets a single user.
  """
  @spec get!(integer) :: User.t() | no_return
  def get!(id), do: Repo.get!(User, id)

  @doc """
  Gets a user based on the params.

  This is used by Phauxth to get user information.
  """
  @spec get_by(map) :: User.t() | nil
  def get_by(%{"session_id" => session_id}) do
    with %Session{user_id: user_id} <- Sessions.get_session(session_id),
         do: Repo.get(User, user_id)
  end

  def get_by(%{"email" => email}) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Creates a user.
  """
  @spec create(map) :: {:ok, User.t()} | changeset_error
  def create(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  """
  @spec update(User.t(), map) :: {:ok, User.t()} | changeset_error
  def update(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.
  """
  @spec delete(User.t()) :: {:ok, User.t()} | changeset_error
  def delete(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  """
  @spec change(User.t()) :: Ecto.Changeset.t()
  def change(%User{} = user) do
    User.changeset(user, %{})
  end
end
