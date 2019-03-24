class Array
  def keep
    return enum_for(:accumulate) unless block_given?
    each_with_object([]) { |obj, acc| acc << obj if yield(obj) }
  end

  def discard
    return enum_for(:accumulate) unless block_given?
    each_with_object([]) { |obj, acc| acc << obj unless yield(obj) }
  end
end
