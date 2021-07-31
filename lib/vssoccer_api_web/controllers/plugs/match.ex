defmodule VssoccerApiWeb.Match do
  @moduledoc """
  Functions to help with matches filtering.
  """

  import Plug.Conn
  import Phoenix.Controller

  def valid_filters(%Plug.Conn{params: params} = conn, opts) do
    filters = Enum.filter(params, fn ({key, _}) -> Enum.member?(opts, key) end)
    if length(filters) > 0 do
      assign(conn, :filters, filters)
    else
      error(conn, :bad_request, 400)
    end
  end

  defp error(conn, status, code) do
    put_status(conn, status)
    |> put_view(VssoccerApiWeb.MatchView)
    |> render("#{code}.json", [])
    |> halt()
  end
end
