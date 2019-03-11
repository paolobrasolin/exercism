module ResistorColors
  ENCODING = %w{
    black
    brown
    red
    orange
    yellow
    green
    blue
    violet
    grey
    white
  }
  
  def self.value(colors)
    colors.map { |color| ENCODING.index(color).to_s }.join.to_i
  end
end
