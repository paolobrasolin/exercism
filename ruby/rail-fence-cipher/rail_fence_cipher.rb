module RailFenceCipher
  def self.encode(decoded, rails_count)
    return decoded if rails_count == 1
    sequence = rails_sequence(decoded.size, rails_count)

    rails = Array.new(rails_count) { "" }
    sequence.zip(decoded.chars) do |index, char|
      rails[index].concat(char)
    end
    rails.join
  end

  def self.decode(encoded, rails_count)
    return encoded if rails_count == 1
    sequence = rails_sequence(encoded.size, rails_count)
    lengths = rails_lengths(encoded.size, rails_count)

    encoded_dup = encoded.dup
    rails = lengths.map { |length| encoded_dup.slice!(0...length) }

    sequence.each.with_object("") do |index, decoded|
      decoded << rails[index].slice!(0)
    end
  end

  def self.nth_rail(n, rails_count)
    mod = 2*(rails_count-1)
    n.modulo(mod).yield_self { |i| [mod-i, i].min }
  end

  def self.rails_sequence(count, rails_count)
    (0...count).map { |i| nth_rail(i, rails_count) }
  end

  def self.rails_lengths(count, rails_count)
    mod = 2*(rails_count-1)
    lengths = Array.new(rails_count) { 0 }
    (0...mod).each do |i|
      char_count = (count - i).fdiv(mod).ceil
      lengths[nth_rail(i, rails_count)] += char_count
    end
    lengths
  end
end
