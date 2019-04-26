module FoodChain
  DATA = [
    ["fly", nil],
    [
      "spider that wriggled and jiggled and tickled inside her",
      "It wriggled and jiggled and tickled inside her.",
    ],
    ["bird", "How absurd to swallow a bird!"],
    ["cat", "Imagine that, to swallow a cat!"],
    ["dog", "What a hog, to swallow a dog!"],
    ["goat", "Just opened her throat and swallowed a goat!"],
    ["cow", "I don't know how she swallowed a cow!"],
    ["horse", "She's dead, of course!"],
  ]
  private_constant :DATA

  def self.verse(n)
    verses = [present(n)]
    verses << exclaim(n) unless n == 0
    verses.concat(n.downto(0).map(&method(:explain))) if n < 7
    verses.join("\n") + "\n"
  end

  def self.song
    (0..7).map(&method(:verse)).join("\n")
  end

  class << self
  private

    def long_name(n)
      DATA[n].first
    end

    def name(n)
      long_name(n).split.first
    end

    def present(n)
      "I know an old lady who swallowed a #{name(n)}."
    end

    def exclaim(n)
      DATA[n].last
    end

    def explain(n)
      return "I don't know why she swallowed the fly. Perhaps she'll die." if n.zero?
      "She swallowed the #{name(n)} to catch the #{long_name(n-1)}."
    end
  end
end
