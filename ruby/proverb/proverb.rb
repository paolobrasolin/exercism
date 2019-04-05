class Proverb
  def initialize(*items, qualifier: nil)
    @items = items
    @qualifier = qualifier
  end

  def to_s
    lines.append(last_line).join("\n")
  end

private

  def lines
    @items.each_cons(2).map do |want, loss|
      "For want of a #{want} the #{loss} was lost."
    end
  end

  def last_line
    "And all for the want of a #{final}."
  end

  def final
    if @qualifier.nil?
      @items.first
    else
      "#{@qualifier} #{@items.first}"
    end
  end
end
