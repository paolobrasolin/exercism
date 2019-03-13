module Isogram
  def self.isogram?(word)
    letters = word.downcase.scan(/[a-z]/)
    letters.uniq.size == letters.size
  end
end
