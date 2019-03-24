class Matrix
  attr_reader :rows, :columns

  def initialize(string)
    @rows = string.lines.map { |line| line.split(" ").map(&:to_i) }
    @columns = @rows.transpose
    init_extrema
  end

  def saddle_points
    points = (0...@rows.size).to_a.product((0...@columns.size).to_a)
    points.select(&method(:is_saddle))
  end

private 

  def init_extrema
    @row_maxima = @rows.map(&:max)
    @column_minima = @columns.map(&:min)
  end

  def is_saddle((i, j))
    @row_maxima[i] == @column_minima[j]
  end
end
