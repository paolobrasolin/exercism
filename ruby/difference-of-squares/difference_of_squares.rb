class Squares
  def initialize(n)
    @numbers = (1..n)
  end

  def square_of_sum
    @numbers.sum**2
  end

  def sum_of_squares
    @numbers.sum { |i| i**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
