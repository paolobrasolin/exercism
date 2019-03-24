class Integer
  def to_roman
    roman = ""
    rest = roman_append_slice(roman, self, 1000, "M", 100, "C")
    rest = roman_append_slice(roman, rest,  500, "D", 100, "C")
    rest = roman_append_slice(roman, rest,  100, "C",  10, "X")
    rest = roman_append_slice(roman, rest,   50, "L",  10, "X")
    rest = roman_append_slice(roman, rest,   10, "X",   1, "I")
    rest = roman_append_slice(roman, rest,    5, "V",   1, "I")
    rest = roman_append_slice(roman, rest,    1, "I",   0, nil)
    roman
  end

private

  def roman_append_slice(roman, number, top_val, top_chr, bot_val, bot_chr)
    threshold = top_val - bot_val
    top_val_count, rest = number.divmod(top_val)
    roman << top_chr * top_val_count
    return rest if rest < threshold
    roman << "#{bot_chr}#{top_chr}"
    rest - threshold
  end
end
