module Board
  BOMB = "*"
  VOID = " "
  MARGIN_ROW_FORMAT = -> (size) { /\+-{#{size - 2}}\+/ }
  CENTER_ROW_FORMAT = -> (size) { /\|[ *1-8]{#{size - 2}}\|/ }

  def self.transform(input)
    raise ArgumentError unless valid_format?(input)

    input.map.with_index do |row, i|
      row.chars.map.with_index do |col, j|
        next col unless col == VOID
        count = count_bombs_around(input, i, j)
        count.positive? ? count : col
      end.join
    end
  end

  class << self
  private

    def count_bombs_around(matrix, i, j)
      neighbours = matrix[i-1..i+1].map { |row| row[j-1..j+1] }
      neighbours.join.count(BOMB)
    end

    def valid_format?(board)
      size = board.first.size
      margin_row_format = MARGIN_ROW_FORMAT.call(size)
      center_row_format = CENTER_ROW_FORMAT.call(size)
      [
        board[0].match?(margin_row_format),
        *board[1..-2].map { |row| row.match?(center_row_format) },
        board[-1].match?(margin_row_format),
      ].all?
    end
  end
end
