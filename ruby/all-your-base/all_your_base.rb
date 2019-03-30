module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError unless valid_base?(input_base)
    raise ArgumentError unless valid_base?(output_base)
    raise ArgumentError unless valid_digits?(digits, base: input_base)
    number = digits_to_number(digits, base: input_base)
    number_to_digits(number, base: output_base)
  end

  class << self
  private

    def valid_base?(base)
      base > 1
    end

    def valid_digits?(digits, base:)
      digits.all?(&(0...base).method(:cover?))
    end

    def digits_to_number(digits, base:)
      digits.reverse.each_with_index.sum { |d, i| d * base ** i }
    end

    def number_to_digits(number, base:)
      return [0] if number.zero?
      digits = []
      until number.zero?
        number, digit = number.divmod(base)
        digits << digit
      end
      digits.reverse
    end
  end
end
