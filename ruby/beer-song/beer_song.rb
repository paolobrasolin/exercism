module BeerSong
  def self.recite(start, count)
    count.times.map { |i| verse(start-i) }.join("\n")
  end

  class << self
  private

    def verse(n)
      <<~BEER
        #{tally_bottles(n)}
        #{n.positive? ? take_down_bottle(n) : buy_more_bottles}
      BEER
    end

    def tally_bottles(n)
      "#{wall_count(n).capitalize}, #{beer_count(n)}."
    end

    def take_down_bottle(n)
      "Take #{n == 1 ? "it" : "one"} down and pass it around, #{wall_count(n.pred)}."
    end

    def buy_more_bottles
      "Go to the store and buy some more, #{wall_count(99)}."
    end

    def wall_count(n)
      "#{beer_count(n)} on the wall"
    end

    def beer_count(n)
      case n
      when (2..) then "#{n} bottles"
      when 1 then "1 bottle"
      when 0 then "no more bottles"
      end + " of beer"
    end
  end
end
