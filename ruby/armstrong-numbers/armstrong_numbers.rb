module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    number == digits.sum { |digit| digit ** digits.size }
  end
end
