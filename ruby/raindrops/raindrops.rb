module Raindrops
  SOUNDS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong",
  }

  def self.convert(number)
    sounds = SOUNDS.filter { |factor, _| number.modulo(factor).zero? }
    sounds.empty? ? number.to_s : sounds.values.join
  end
end
