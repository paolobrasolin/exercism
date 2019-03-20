class Anagram
  def initialize(word)
    @control_word = word
    @control_invariant = anagram_invariant(word)
  end

  def match(words)
    words.select { |word| !is_same(word) && is_anagram(word) }
  end

private

  def is_same(word)
    @control_word.casecmp(word).zero?
  end

  def is_anagram(word)
    @control_invariant == anagram_invariant(word)
  end

  def anagram_invariant(word)
    word.downcase.chars.sort
  end
end