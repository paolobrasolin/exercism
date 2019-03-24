class Sieve
  def initialize(bound)
    @bound = bound
  end

  def primes
    primes = (2..@bound).to_a
    primes.each do |n|
      primes.delete_if do |m|
        n < m && m.modulo(n).zero?
      end
    end
  end
end
