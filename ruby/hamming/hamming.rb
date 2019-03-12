module Hamming
  def self.compute(dna, dnb)
    raise ArgumentError if dna.size != dnb.size
    0.upto(dna.size).sum { |i| dna[i] != dnb[i] ? 1 : 0 }
  end
end
