module Acronym
  def self.abbreviate(phrase)
    phrase.split(/ |-/).map(&:chr).join.upcase
  end
end