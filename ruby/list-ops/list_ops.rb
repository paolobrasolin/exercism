module ListOps
  def self.arrays(list)
    fold(list, 0, :+, -> (_) { 1 })
  end

  def self.reverser(list)
    fold(list.dup, [], :unshift)
  end

  def self.concatter(*lists)
    fold(lists, [], :+)
  end

  def self.mapper(list)
    fold(list, [], :<<, -> (x) { yield x })
  end

  def self.filterer(list)
    fold(list, [], :<<) { |x| yield x }
  end

  def self.sum_reducer(list)
    fold(list, 0, :+)
  end

  def self.factorial_reducer(list)
    fold(list, 1, :*)
  end

  def self.fold(list, accumulator, combinator, operator=->(x){x})
    list.each do |element|
      next unless yield element if block_given?
      accumulated_element = operator.call(element)
      accumulator = accumulator.send(combinator, accumulated_element)
    end
    accumulator
  end
end
