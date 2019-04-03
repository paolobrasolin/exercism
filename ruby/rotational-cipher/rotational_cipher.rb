module RotationalCipher
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"

  def self.rotate(string, rotations)
    rotated_alphabet = ALPHABET.chars.rotate(rotations).join
    string.dup.tap do |result|
      result.tr!(ALPHABET, rotated_alphabet)
      result.tr!(ALPHABET.upcase, rotated_alphabet.upcase)
    end
  end
end
