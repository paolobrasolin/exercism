class Phrase
  WORDS = /\b[\w']+\b/

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |word, counter|
      counter[word] += 1
    end
  end

private

  def words
    @phrase.downcase.scan(WORDS)
  end
end
