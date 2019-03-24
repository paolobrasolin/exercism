module PhoneNumber
  MATCHER = /\A\D*1?\D*([2-9]\d{2})\D*([2-9]\d{2})\D*(\d{4})\D*\Z/

  def self.clean(string)
    return unless string =~ MATCHER
    Regexp.last_match.captures.join
  end
end
