class Series
  def initialize(string)
    @chars = string.chars
  end

  def slices(n)
    raise ArgumentError if n > @chars.size
    @chars.each_cons(n).map(&:join)
  end
end
