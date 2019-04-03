module Transpose
  def self.transpose(string)
    string.
      split("\n").map(&:chars).
      yield_self(&method(:safe_transpose)).
      map(&:join).join("\n")
  end

  class << self
  private

    def safe_transpose(arrays)
      max_length = arrays.map(&:length).max
      arrays.
        # pad to same length with nils and transpose
        map { |array| array.values_at(0...max_length) }.transpose.
        # remove padding rightmost padding nils
        map { |array| array.reverse.drop_while(&:nil?).reverse }.
        # replace leftmost padding nils with space
        map { |array| array.map { |l| l || ' ' } }
    end
  end
end
