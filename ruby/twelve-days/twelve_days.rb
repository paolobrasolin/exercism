module TwelveDays
  ORDINALS = [
    "first", "second", "third", "fourth", "fifth", "sixth",
    "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth",
  ]

  GIFTS = [
    "a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens",
    "four Calling Birds", "five Gold Rings", "six Geese-a-Laying",
    "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing",
    "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming",
  ]

  def self.song
    1.upto(12).map(&method(:day)).join("\n")
  end

  def self.day(n)
    gift_list = to_sentence(*GIFTS[0..n-1].reverse)
    "On the #{ORDINALS[n-1]} day of Christmas my true love gave to me: #{gift_list}.\n"
  end

  def self.to_sentence(*items)
    *init, last = items
    init.empty? ? last : "#{init.join(", ")}, and #{last}"
  end
end
