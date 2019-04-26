module BinomialCoefficient
  refine Integer do
    def choose(k)
      (self - k + 1 .. self).inject(1, :*) / (2 .. k).inject(1, :*)
    end
  end
end

class Triangle
  using BinomialCoefficient

  def initialize(size)
    @size = size
  end

  def rows
    (0...@size).map do |n|
      (0..n).map do |k|
        n.choose(k)
      end
    end
  end
end
