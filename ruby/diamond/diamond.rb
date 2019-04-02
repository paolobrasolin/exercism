class Diamond
  def initialize(letter)
    @size = 2 * (letter.ord - 'A'.ord) + 1
  end

  def to_s
    build.map(&:join).join("\n") + "\n"
  end

  def self.make_diamond(letter)
    new(letter).to_s
  end

private

  def build
    (0...@size).map do |row|
      (0...@size).map do |col|
        on_diamond(row, col) ? col_to_letter(col) : ' '
      end
    end
  end

  def distance_from_median(i)
    (@size - 1 - 2 * i).abs
  end

  def col_to_letter(i)
    ('A'.ord + distance_from_median(i).div(2)).chr
  end

  def on_diamond(i, j)
    @size - 1 == distance_from_median(i) + distance_from_median(j)
  end
end
