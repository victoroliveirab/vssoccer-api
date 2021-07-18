defmodule VssoccerApiWeb.UserControllerTest do
  use VssoccerApiWeb.ConnCase

  import VssoccerApiWeb.AuthTestHelpers

  alias VssoccerApi.Actions.Users

  @create_attrs %{email: "bill@example.com", password: "hard2guess"}
  @update_attrs %{email: "william@example.com"}
  @invalid_attrs %{email: nil}

  setup %{conn: conn} do
    {:ok, %{conn: conn}}
  end

  describe "show user resource" do
    setup [:add_user_session]

    test "show chosen user's page", %{conn: conn, user: user} do
      conn = get(conn, Routes.user_path(conn, :show, user))
      assert json_response(conn, 200)["data"] == %{"id" => user.id, "email" => "reg@example.com"}
    end
  end

  describe "create user" do
    test "creates user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)
      assert json_response(conn, 201)["data"]["id"]
      assert Users.get_by(%{"email" => "bill@example.com"})
    end

    test "does not create user and renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "updates user" do
    setup [:add_user_session]

    test "updates chosen user when data is valid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert json_response(conn, 200)["data"]["id"] == user.id
      updated_user = Users.get!(user.id)
      assert updated_user.email == "william@example.com"
    end

    test "does not update chosen user and renders errors when data is invalid", %{
      conn: conn,
      user: user
    } do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:add_user_session]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 204)
      assert_raise Ecto.NoResultsError, fn -> Users.get!(user.id) end
    end

    test "cannot delete other user", %{conn: conn} do
      other = add_user("tony@example.com")
      conn = delete(conn, Routes.user_path(conn, :delete, other))
      assert json_response(conn, 403)["errors"]["detail"] =~ "not authorized"
      assert Users.get!(other.id)
    end
  end

  defp add_user_session(%{conn: conn}) do
    user = add_user("reg@example.com")
    conn = conn |> add_token_conn(user)
    {:ok, %{conn: conn, user: user}}
  end
end
