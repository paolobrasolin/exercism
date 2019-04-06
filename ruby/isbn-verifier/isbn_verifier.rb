module IsbnVerifier
  WIDE_FORMAT = /\A\d-?\d{3}-?\d{5}-?(\d|X)\Z/
  THIN_FORMAT = /\A\d{9}(\d|X)\Z/
  DIGITS = /\d|X/

  def self.valid?(code)
    valid_format?(code) && valid_checksum?(code)
  end

  class << self
  private

    def valid_format?(code)
      code.match?(THIN_FORMAT) || code.match?(WIDE_FORMAT)
    end

    def valid_checksum?(code)
      digits = code.scan(DIGITS).map(&method(:digit_to_i))
      digits.map.with_index.
        sum { |digit, index| digit * (10 - index) }.
        modulo(11).zero?
    end

    def digit_to_i(digit)
      digit == "X" ? 10 : digit.to_i
    end
  end
end
