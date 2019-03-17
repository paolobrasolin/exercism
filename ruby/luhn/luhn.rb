module Luhn
  TWO_OR_MORE_DIGITS = /\A(\s*\d){2,}\s*\Z/

  def self.valid?(string)
    return false unless string.match?(TWO_OR_MORE_DIGITS)
    checksum(*digits(string)).modulo(10).zero?
  end

  def self.checksum(*digits)
    digits.reverse.each_slice(2).sum do |even, odd|
      next even if odd.nil?
      even + clamped_double(odd)
    end
  end

  def self.digits(string)
    string.scan(/\d/).map(&:to_i)
  end

  def self.clamped_double(n)
    n>4 ? 2*n-9 : 2*n
  end
end
