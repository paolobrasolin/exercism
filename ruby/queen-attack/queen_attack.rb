class Queens
  BOARD_RANGE = (0..7)

  def initialize(white: [], black: [])
    raise ArgumentError unless on_board?(white) && on_board?(black)
    @white = white
    @black = black
  end

  def attack?
    same_row? || same_col? || same_diagonal?
  end

private

  def on_board?(queen)
    queen.all? { |coordinate| BOARD_RANGE.include?(coordinate) }
  end

  def same_row?
    @white[0] == @black[0]
  end

  def same_col?
    @white[1] == @black[1]
  end

  def same_diagonal?
    (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
  end
end
