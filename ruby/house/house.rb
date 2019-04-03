module House
  DATA = [
    [nil, "the horse and the hound and the horn"],
    ["belonged to", "the farmer sowing his corn"],
    ["kept", "the rooster that crowed in the morn"],
    ["woke", "the priest all shaven and shorn"],
    ["married", "the man all tattered and torn"],
    ["kissed", "the maiden all forlorn"],
    ["milked", "the cow with the crumpled horn"],
    ["tossed", "the dog"],
    ["worried", "the cat"],
    ["killed", "the rat"],
    ["ate", "the malt"],
    ["lay in", "the house that Jack built."],
  ]

  def self.verse(n)
    DATA[DATA.length-n..].map.with_index do |(action, object), index|
      next "This is #{object}\n" if index.zero?
      "that #{action} #{object}\n"
    end.join
  end

  def self.recite
    (1..12).map(&method(:verse)).join("\n")
  end
end
