class Series
  def initialize(digits)
    raise ArgumentError if digits.match?(/\D/)
    @digits = digits.chars.map(&:to_i)
  end

  def largest_product(n)
    return 1 if n.zero?
    raise ArgumentError if n > @digits.length
    @digits.each_cons(n).map{ |digits| digits.inject(:*) }.max
  end
end
