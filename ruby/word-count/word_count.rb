class Phrase
  WORDS = /\w+(?:'t)?/i

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.scan(WORDS).each_with_object(Hash.new(0)) do |word,h|
      h[word.downcase] += 1
    end
  end
end