class Array
  def accumulate
    return enum_for(:accumulate) unless block_given?
    each_with_object([]) { |obj, acc| acc << yield(obj) }
  end
end
