module Luhn
  TWO_OR_MORE_DIGITS = /\A(\s*\d){2,}\s*\Z/

  def self.valid?(string)
    return false unless string.match?(TWO_OR_MORE_DIGITS)
    digits = string.scan(/\d/).map(&:to_i)
    checksum(*digits).modulo(10).zero?
  end

  def self.checksum(*digits)
    digits.reverse.each_with_index.sum do |d, index|
      next d if index.even?
      (2*d).yield_self { |n| n>9 ? n-9 : n } 
    end
  end
end
