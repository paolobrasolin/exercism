module Translation
  class Error < StandardError; end
  class InvalidCodonError < Error; end

  STOP = "STOP"

  DICTIONARY = {
    %w{UUA UUG}         => 'Leucine',
    %w{AUG}             => 'Methionine',
    %w{UUC UUU}         => 'Phenylalanine',
    %w{UCU UCC UCA UCG} => 'Serine',
    %w{UAU UAC}         => 'Tyrosine',
    %w{UGU UGC}         => 'Cysteine',
    %w{UGG}             => 'Tryptophan',
    %w{UAA UAG UGA}     => STOP,
  }.map.with_object({}) { |(ks,v),h| ks.each { |k| h[k] = v } }

  def self.of_codon(codon)
    DICTIONARY[codon]
  end

  def self.of_rna(strand)
    strand.scan(/.../).each.with_object([]) do |codon, proteins|
      case protein = Translation.of_codon(codon)
      when STOP then return proteins
      when nil then raise InvalidCodonError
      else proteins << protein
      end
    end
  end
end
