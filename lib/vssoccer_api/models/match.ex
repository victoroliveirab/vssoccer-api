defmodule VssoccerApi.Models.Match do
  @moduledoc """
  Model Match.
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias VssoccerApi.Models.{Competition, Team}
  @required_params [:api_id, :home_team_id, :away_team_id, :competition_id, :description]

  @derive {
    Jason.Encoder,
    only: [
      :id, :home_team_id, :away_team_id, :competition_id, :home_goals, :away_goals,
      :et_home_goals, :et_away_goals, :pen_home_goals, :pen_away_goals, :description,
      :match_time, :status, :elapsed
    ]
  }

  @type t :: %__MODULE__{
    id: integer,
    api_id: integer,
    home_team: Team.t() | %Ecto.Association.NotLoaded{},
    home_team_id: integer,
    away_team: Team.t() | %Ecto.Association.NotLoaded{},
    away_team_id: integer,
    competition: Competition.t() | %Ecto.Association.NotLoaded{},
    competition_id: integer,
    home_goals: integer,
    away_goals: integer,
    et_home_goals: integer,
    et_away_goals: integer,
    pen_home_goals: integer,
    pen_away_goals: integer,
    description: String.t(),
    match_time: DateTime.t(),
    status: String.t(),
    elapsed: integer,
  }

  schema "matches" do
    field :api_id, :integer
    field :home_goals, :integer
    field :away_goals, :integer
    field :et_home_goals, :integer
    field :et_away_goals, :integer
    field :pen_home_goals, :integer
    field :pen_away_goals, :integer
    field :description, :string
    field :match_time, :utc_datetime
    field :status, :string
    field :elapsed, :integer

    belongs_to :home_team, Team
    belongs_to :away_team, Team
    belongs_to :competition, Competition
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:api_id])
  end

end
