module Pangram
  def self.pangram?(sentence)
    26 == sentence.downcase.scan(/[a-z]/).uniq.length
  end
end
