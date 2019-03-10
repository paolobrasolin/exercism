class HighScores < Array
  alias :scores :itself
  alias :latest :last
  alias :personal_best :max

  def personal_top_three
    sort.last(3).reverse
  end
end
