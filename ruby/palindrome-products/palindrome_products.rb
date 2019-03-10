class Palindromes
  PalindromeProduct = Struct.new(:value, :factors)

  def initialize(min_factor: 1, max_factor:)
    @min_factor = min_factor
    @max_factor = max_factor
    @min_value = +Float::INFINITY
    @max_value = -Float::INFINITY
    @min_factors = []
    @max_factors = []
  end

  def generate
    (@min_factor..@max_factor).each do |f|
      (f..@max_factor).each do |g|
        value = f * g
        next unless is_palindrome(value)
        check_min(value, [f, g])
        check_max(value, [f, g])
      end
    end
  end

  def largest
    PalindromeProduct.new(@max_value, @max_factors)
  end

  def smallest
    PalindromeProduct.new(@min_value, @min_factors)
  end

private

  def check_min(value, factors)
    if value < @min_value
      @min_value = value
      @min_factors = [factors]
    elsif value == @min_value
      @min_factors << factors
    end
  end

  def check_max(value, factors)
    if value > @max_value
      @max_value = value
      @max_factors = [factors]
    elsif value == @max_value
      @max_factors << factors
    end
  end

  def is_palindrome(number)
    number.to_s.yield_self { |n| n == n.reverse }
  end
end
