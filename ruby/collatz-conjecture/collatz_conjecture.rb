module CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n.positive?
    (0..).each do |i|
      return i if n == 1
      n = n.even? ? (n / 2) : (n * 3 + 1)
    end
  end
end
