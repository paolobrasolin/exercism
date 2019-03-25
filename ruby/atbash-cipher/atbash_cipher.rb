module Atbash
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"

  def self.encode(plaintext)
    plaintext.
      gsub(/\W/, '').downcase.
      tr(ALPHABET, ALPHABET.reverse).
      scan(/.{1,5}/).join(" ")
  end
end
