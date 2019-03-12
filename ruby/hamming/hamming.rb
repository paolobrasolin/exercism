module Hamming
  def self.compute(dna, dnb)
    raise ArgumentError if dna.size != dnb.size
    0.upto(dna.size).count { |i| dna[i] != dnb[i] }
  end
end
