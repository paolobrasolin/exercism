module PigLatin
  STABLE_RULES = [
    /^[aeiou]/,
    /^(xr|yt)/,
  ]

  ROTATE_RULES = [
    /^[^aeiou]?qu/,
    /^[^aeiou]?[^aeiouy]*/,
  ]

  def self.translate(phrase)
    phrase.split.map(&method(:translate_word)).join(" ")
  end

  class << self
  private

    def rotate(word, count)
      word[count..] + word[0..count-1]
    end

    def translate_word(word)
      case word
      when *STABLE_RULES then word
      when *ROTATE_RULES
        rotate(word, Regexp.last_match[0].length)
      else word
      end + "ay"
    end
  end
end
