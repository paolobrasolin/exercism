class Scale
  QUALITIES_TO_STEPS = { "m" => 1, "M" => 2, "A" => 3 }
  SHARP_SCALES = %w{C G D A E B F# a e b f# c# g# d#}
  SHARPS = %w{A A# B C C# D D# E F F# G G#}
  FLATS  = %w{A Bb B C Db D Eb E F Gb G Ab}

  def initialize(tonic, scale, qualities="m"*12)
    @steps = qualities.chars.map(&QUALITIES_TO_STEPS)
    @tonic = tonic
    @scale = scale
  end

  def name
    "#{@tonic} #{@scale}".capitalize
  end

  def pitches
    Array.new(@steps.size) do |i|
      chromatic[@steps.take(i).sum]
    end
  end

  private

  def chromatic
    scale = SHARP_SCALES.include?(@tonic) ? SHARPS : FLATS
    scale.rotate(scale.index(@tonic.capitalize))
  end
end
