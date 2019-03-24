module Prime
  def self.nth(n)
    raise ArgumentError unless n.positive?
    primes = []
    (2..).each do |m|
      next if primes.any? { |p| m.modulo(p).zero? }
      return m if primes.length == n - 1
      primes << m 
    end
  end
end
