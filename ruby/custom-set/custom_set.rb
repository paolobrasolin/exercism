class CustomSet
  def initialize(elements)
    @elements = elements.dup
    normalize_elements!
  end

  def empty?
    @elements.empty?
  end

  def member?(element)
    @elements.member?(element)
  end

  def subset?(set)
    (@elements - set.elements).empty?
  end

  def disjoint?(set)
    (@elements & set.elements).empty?
  end

  def ==(set)
    @elements == set.elements
  end

  def add(element)
    @elements.push(element)
    normalize_elements!
    self
  end

  def intersection(set)
    self.class.new(@elements & set.elements)
  end

  def difference(set)
    self.class.new(@elements - set.elements)
  end

  def union(set)
    self.class.new(@elements + set.elements)
  end

protected

  attr_reader :elements

  def normalize_elements!
    @elements.sort!.uniq!
  end
end
