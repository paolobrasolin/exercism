module Acronym
  TERM_INITIAL = /(?<=\P{L}|^)\p{L}(?<!'s\b)/i

  def self.abbreviate(phrase)
    phrase.scan(TERM_INITIAL).join.upcase
  end
end