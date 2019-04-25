class Result < Array
  FLIPPED = { "win" => "loss", "draw" => "draw", "loss" => "win" }
  SCORES = { "win" => 3, "draw" => 1, "loss" => 0 }

  attr_accessor :team_name

  def points
    sum(&SCORES)
  end

  def <=>(other)
    [-points, team_name] <=> [-other.points, other.team_name]
  end

  def to_board_row
    [
      team_name,
      size, # matches played
      count("win"),
      count("draw"),
      count("loss"),
      points,
    ]
  end
end

class Board
  HEADER = %w{Team MP W D L P}
  SPACER = " | "
  NEWLINE = "\n"
  NAME_COL_WIDTH = 30
  DATA_COL_WIDTH = 2

  def initialize
    @rows = [HEADER]
  end

  def push(*rows)
    tap { @rows.push(*rows) }
  end

  def render
    @rows.map { |row| render_row(*row) + NEWLINE }.join
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

  def self.tally(input)
    board_rows = read_results(input).sort.map(&:to_board_row)
    Board.new.push(*board_rows).render
  end

  class << self
  private

    def read_results(input)
      roster = Hash.new do |h, k|
        h[k] = Result.new.tap { |r| r.team_name = k }
      end
      input.scan(DATAROW).each_with_object(roster) do |(home, away, result), roster|
        roster[home] << result
        roster[away] << Result::FLIPPED[result]
      end.values
    end
  end
end
