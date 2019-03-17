module RunLengthEncoding
  def self.encode(string)
    string.chars.slice_when(&:!=).map do |streak|
      streak.one? ? streak : [streak.length, streak.first]
    end.join
  end

  def self.decode(string)
    string.scan(/(\d*)(\D)/).map do |length, char|
      char * (length.empty? ? 1 : length.to_i)
    end.join
  end
end
