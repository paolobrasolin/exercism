class Phrase
  WORDS = /\w+(?:'t)?/i

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    count_occurrences(words)
  end

private

  def words
    @phrase.downcase.scan(WORDS)
  end

  def count_occurrences(items)
    items.each_with_object(Hash.new(0)) do |item, counter|
      counter[item] += 1
    end
  end
end
