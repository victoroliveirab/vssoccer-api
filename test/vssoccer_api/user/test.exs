defmodule VssoccerApi.UserTest do
  use VssoccerApi.DataCase

  alias VssoccerApi.Actions.Users
  alias VssoccerApi.Models.User

  @create_attrs %{email: "fred@example.com", password: "reallyHard2gue$$"}
  @update_attrs %{email: "frederick@example.com"}
  @invalid_attrs %{email: "", password: ""}

  def fixture(:user, attrs \\ @create_attrs) do
    {:ok, user} = Users.create(attrs)
    user
  end

  describe "read user data" do
    test "list/1 returns all users" do
      user = fixture(:user)
      assert Users.list() == [user]
    end

    test "get! returns the user with given id" do
      user = fixture(:user)
      assert Users.get!(user.id) == user
    end

    test "change/1 returns a user changeset" do
      user = fixture(:user)
      assert %Ecto.Changeset{} = Users.change(user)
    end
  end

  describe "write user data" do
    test "create/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create(@create_attrs)
      assert user.email == "fred@example.com"
    end

    test "create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create(@invalid_attrs)
    end

    test "update/2 with valid data updates the user" do
      user = fixture(:user)
      assert {:ok, user} = Users.update(user, @update_attrs)
      assert %User{} = user
      assert user.email == "frederick@example.com"
    end

    test "update/2 with invalid data returns error changeset" do
      user = fixture(:user)
      assert {:error, %Ecto.Changeset{}} = Users.update(user, @invalid_attrs)
      assert user == Users.get!(user.id)
    end
  end

  describe "delete user data" do
    test "delete/1 deletes the user" do
      user = fixture(:user)
      assert {:ok, %User{}} = Users.delete(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get!(user.id) end
    end
  end
end
