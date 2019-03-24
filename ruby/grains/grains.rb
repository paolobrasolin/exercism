module Grains
  def self.square(n)
    raise ArgumentError unless (1..64).include?(n)
    2**(n-1)
  end

  def self.total
    2**64-1
  end
end
