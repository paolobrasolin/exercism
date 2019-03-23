module TwelveDays
  ORDINALS = [
    "first", "second", "third", "fourth", "fifth", "sixth",
    "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth",
  ]
  private_constant :ORDINALS

  GIFTS = [
    "a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens",
    "four Calling Birds", "five Gold Rings", "six Geese-a-Laying",
    "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing",
    "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming",
  ]
  private_constant :GIFTS

  def self.song
    1.upto(12).map(&method(:verse)).join("\n")
  end

  class << self
  private

    def verse(n)
      "On the #{human_ordinal(n)} verse of Christmas my true love gave to me: #{human_gifts_list(n)}.\n"
    end

    def human_ordinal(n)
      ORDINALS[n-1]
    end

    def human_gifts_list(n)
      to_sentence(*GIFTS[0..n-1].reverse)
    end

    def to_sentence(*items)
      *init, last = items
      init.empty? ? last : "#{init.join(", ")}, and #{last}"
    end
  end
end
