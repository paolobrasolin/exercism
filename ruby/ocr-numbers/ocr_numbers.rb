module OcrNumbers
  GRID_ROW_SIZE = 4
  GRID_COL_SIZE = 3

  DIGITS = Hash.new("?").merge(
    " _ | ||_|   " => "0",
    "     |  |   " => "1",
    " _  _||_    " => "2",
    " _  _| _|   " => "3",
    "   |_|  |   " => "4",
    " _ |_  _|   " => "5",
    " _ |_ |_|   " => "6",
    " _   |  |   " => "7",
    " _ |_||_|   " => "8",
    " _ |_| _|   " => "9",
  )

  def self.convert(input)
    input_lines = input.split("\n")
    raise ArgumentError unless valid_grid_row_format?(input_lines)
    raise ArgumentError unless valid_grid_col_format!(input_lines)
    grid = input_lines_to_grid(input_lines)
    grid.map { |row| row.map(&DIGITS).join }.join(",")
  end

  class << self
  private

    def valid_grid_row_format?(input_lines)
      input_lines.length.modulo(GRID_ROW_SIZE).zero?
    end

    def valid_grid_col_format!(input_lines)
      input_lines.all? do |input_line|
        input_line.length.modulo(GRID_COL_SIZE).zero?
      end
    end

    def input_lines_to_grid(input_lines)
      input_lines.each_slice(GRID_ROW_SIZE).map do |row_lines|
        row_lines.map do |row_line|
          row_line.chars.each_slice(GRID_COL_SIZE).map(&:join)
        end.transpose.map(&:join)
      end
    end
  end
end
