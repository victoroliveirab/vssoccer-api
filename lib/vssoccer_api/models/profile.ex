defmodule VssoccerApi.Models.Profile do
  @moduledoc """
  Model Profile.
  """
  use Ecto.Schema

  alias VssoccerApi.Models.{Country, Team, User}

  schema "profiles" do
    belongs_to :user, User
    belongs_to :country, Country
    has_many :teams, Team
  end

end
