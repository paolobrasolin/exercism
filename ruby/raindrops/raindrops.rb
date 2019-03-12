module Raindrops
  SOUNDS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong",
  }

  def self.convert(number)
    sounds = SOUNDS.filter { |factor, _| number.modulo(factor).zero? }.values
    sounds.empty? ? number.to_s : sounds.join
  end
end
