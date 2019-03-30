module PerfectNumber
  CATEGORIES = %w{perfect abundant deficient}

  def self.classify(number)
    raise RuntimeError unless number.positive?
    CATEGORIES[aliquot_sum(number) <=> number]
  end

  class << self
  private

    def aliquot_sum(number)
      (1...number).select { |divisor| number.modulo(divisor).zero? }.sum
    end
  end
end
