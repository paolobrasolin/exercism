module Change
  class Error < StandardError; end
  class ImpossibleCombinationError < Error; end
  class NegativeTargetError < Error; end

  def self.generate(denominations, target)
    return [] if target.zero?
    raise NegativeTargetError if target.negative?

    min_count = (0..target).to_a
    min_coins = Array.new(target+1) { [] }

    0.upto(target) do |amount|
      denominations.each do |coin|
        rest = amount - coin
        next if rest.negative?

        new_min_count = min_count[rest] + 1
        next if min_count[amount] < new_min_count

        new_min_coins = [*min_coins[rest], coin]
        next if amount != new_min_coins.sum

        min_count[amount] = new_min_count
        min_coins[amount] = new_min_coins
      end
    end

    raise ImpossibleCombinationError if min_coins[target].empty?
    min_coins[target]
  end
end
