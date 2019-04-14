class Team
  attr_reader :name, :win, :draw, :loss

  def initialize(name)
    @name = name
    @win = 0
    @draw = 0
    @loss = 0
  end

  def play(outcome)
    case outcome
    when "win"  then @win  += 1
    when "draw" then @draw += 1
    when "loss" then @loss += 1
    end
  end

  def matches_played
    [@win, @draw, @loss].sum
  end

  def points
    [@win * 3, @draw * 1, @loss * 0].sum
  end
end

class Board
  HEADER = %w{Team MP W D L P}
  SPACER = " | "
  NAME_COL_WIDTH = 30
  DATA_COL_WIDTH = 2

  def initialize
    @rows = [HEADER]
  end

  def concat(row)
    @rows.concat(row)
  end

  def render
    @rows.map { |row| render_row(*row) + "\n" }.join
  end

private

  def render_row(name, *data)
    [
      name.to_s.ljust(NAME_COL_WIDTH),
      *data.map { |datum| datum.to_s.rjust(DATA_COL_WIDTH) },
    ].join(SPACER)
  end
end

module Tournament
  DATAROW = /^(.*?);(.*?);(.*?)$/
  FLIP_OUTCOME = %w{win draw loss}.
    yield_self { |os| os.reverse.zip(os).to_h }

  def self.tally(input)
    teams = read_teams(input)
    sorted_teams = sort_teams(teams)

    board_team_rows = sorted_teams.map(&method(:team_to_board_row))

    board = Board.new
    board.concat(board_team_rows)
    board.render
  end

  class << self
  private

    def read_teams(input)
      teams = Hash.new { |h, name| h[name] = Team.new(name) }
      input.scan(DATAROW).each do |team_a, team_b, outcome|
        teams[team_a].play(outcome)
        teams[team_b].play(FLIP_OUTCOME[outcome])
      end
      teams.values
    end

    def sort_teams(teams)
      teams.sort_by { |team| [-team.points, team.name] }
    end

    def team_to_board_row(team)
      [
        team.name,
        team.matches_played,
        team.win,
        team.draw, 
        team.loss,
        team.points,
      ]
    end
  end
end
