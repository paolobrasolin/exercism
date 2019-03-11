class Triangle < Array
  def equilateral?
    uniq.length == 1 if valid?
  end

  def isosceles?
    uniq.length <= 2 if valid?
  end

  def scalene?
    uniq.length == 3 if valid?
  end

private

  def valid?
    return false unless size == 3
    return false unless all?(&:positive?)
    triangular_inequality_holds?
  end

  def triangular_inequality_holds?
    *short_sides, long_side = *sort
    short_sides.sum >= long_side
  end
end