module Isogram
  def self.isogram?(word)
    not word.each_char.with_object(Hash.new(false)) do |char, toggler|
      next unless char =~ /[a-z]/i
      break unless toggler[char.downcase] ^= true
    end.nil?
  end
end
