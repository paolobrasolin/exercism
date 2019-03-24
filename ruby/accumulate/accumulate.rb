class Array
  def accumulate
    accumulator = Array.new
    0.upto(length - 1).each do |i|
      accumulator << yield(self[i])
    end
    accumulator
  end
end
