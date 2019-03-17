class SumOfMultiples
  def initialize(*nums)
    @nums = nums.reject(&:zero?)
  end
  
  def to(max)
    (0...max).select(&method(:multiple_of_any_num?)).sum
  end

private

  def multiple_of_any_num?(n)
    @nums.any? { |num| n.modulo(num).zero? }
  end
end
