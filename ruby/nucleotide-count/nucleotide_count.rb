class Nucleotide < Array
  VALID_DNA = /\A[ATGC]*\Z/
  HISTOGRAM = { "A" => 0, "T" => 0, "C" => 0, "G" => 0 }

  def histogram
    each_with_object(HISTOGRAM.dup) do |nucleotide, histogram|
      histogram[nucleotide] += 1
    end
  end

  def self.from_dna(strand)
    raise ArgumentError unless strand.match?(VALID_DNA)
    new(strand.chars)
  end
end
