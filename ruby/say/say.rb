class Say
  ALLOWED_RANGE = (0...1e12)

  BASE_NUMBERS = %w{
    zero one two three four
    five six seven eight nine
    ten eleven twelve thirteen fourteen
    fifteen sixteen seventeen eighteen nineteen
  }

  MULTIPLES_OF_TEN = %w{
    twenty thirty forty fifty
    sixty seventy eighty ninety
  }.unshift(nil, nil)

  POWERS_OF_TEN = {
    "billion"  => 1_000_000_000,
    "million"  =>     1_000_000,
    "thousand" =>         1_000,
    "hundred"  =>           100,
  }

  def initialize(number)
    @number = number
  end

  def in_english(number=@number)
    raise ArgumentError unless ALLOWED_RANGE.include?(number)
    number < 100 ? in_english_small(number) : in_english_big(number)
  end

private

  def in_english_big(number)
    pot_name, pot_number = POWERS_OF_TEN.detect { |_, n| number >= n }
    div, mod = number.divmod(pot_number)
    "#{in_english(div)} #{pot_name}".tap do |english|
      english << " #{in_english(mod)}" if mod.positive?
    end
  end

  def in_english_small(number)
    if number < 20
      BASE_NUMBERS[number]
    elsif number.modulo(10).zero?
      div = number.div(10)
      MULTIPLES_OF_TEN[div]
    else
      div, mod = number.divmod(10)
      "#{MULTIPLES_OF_TEN[div]}-#{BASE_NUMBERS[mod]}"
    end
  end
end
