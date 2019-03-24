class Robot
  NAME_ALPHA_PREFIX_LENGTH = 2
  NAME_DIGIT_SUFFIX_LENGTH = 3
  ALPHA_COUNT = 26
  DIGIT_COUNT = 10
  SERIALS_COUNT = ALPHA_COUNT**NAME_ALPHA_PREFIX_LENGTH * DIGIT_COUNT**NAME_DIGIT_SUFFIX_LENGTH 
  SERIALS_RANGE = (0...SERIALS_COUNT)
  MIN_ALPHA = 'A'
  MIN_DIGIT = '0'

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = serial_to_name(@@serials.pop)
  end

  def self.forget
    @@serials = SERIALS_RANGE.to_a.shuffle
  end

private

  def serial_to_name(serial)
    letters, digits = serial.divmod(DIGIT_COUNT**NAME_DIGIT_SUFFIX_LENGTH)
    prefix = letters.divmod(ALPHA_COUNT).map { |offset| (MIN_ALPHA.ord + offset).chr }.join
    suffix = digits.to_s.rjust(NAME_DIGIT_SUFFIX_LENGTH, MIN_DIGIT)
    "#{prefix}#{suffix}"
  end
end
