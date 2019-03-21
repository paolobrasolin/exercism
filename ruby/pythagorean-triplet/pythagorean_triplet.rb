class Triplet
  def initialize(a, b, c)
    @sides = [a, b, c].sort
    @a, @b, @c = *@sides
  end

  def sum
    @sides.sum
  end

  def product
    @sides.inject(:*)
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.enumerate(min: 1, max:)
    Enumerator.new do |yielder|
      m_max = Math.sqrt(2*max-1).floor
      (3..m_max).step(2).each do |m|
        (1...m).step(2).each do |n|
          next unless coprime(m, n)
          a, b, c = euclid_formula(n, m)
          (min.fdiv(a).ceil..max.div(c)).each do |k|
            yielder << new(k*a, k*b, k*c)
          end
        end
      end
    end
  end

  def self.coprime(x, y)
    x.gcd(y) == 1
  end

  def self.euclid_formula(n, m)
    # ASSUMPTION: 0 < n < m
    c = (m**2 + n**2).div(2)
    a, b = [m*n, (m**2 - n**2).div(2)].sort
    [a, b, c]
  end

  def self.where(sum: nil, min_factor: 1, max_factor:)
    enumerate(min: min_factor, max: max_factor).
      reject { |triple| sum&.!=(triple.sum) }
  end
end
