module Bob
  YELL = /(?=.*\p{Lu})\P{Ll}+/

  def self.hey(remark)
    case remark
    when /\A\s*\Z/ then "Fine. Be that way!"
    when /\A#{YELL}\?\s*\Z/ then "Calm down, I know what I'm doing!"
    when /\?\s*\Z/ then "Sure."
    when /\A#{YELL}\Z/ then "Whoa, chill out!"
    else "Whatever."
    end
  end
end
