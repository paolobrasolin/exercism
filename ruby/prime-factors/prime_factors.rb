require 'prime'

module PrimeFactors
  def self.for(integer)
    Prime.prime_division(integer).flat_map do |prime, exponent|
      Array.new(exponent, prime)
    end
  end
end
