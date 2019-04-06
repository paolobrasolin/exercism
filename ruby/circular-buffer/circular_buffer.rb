class CircularBuffer < Array
  class Error < StandardError; end
  class BufferEmptyException < Error; end
  class BufferFullException < Error; end

  def initialize(max_size)
    @max_size = max_size
  end

  def write(data)
    raise BufferFullException if full?
    push(data)
  end

  def write!(data)
    rotate!.pop if full?
    push(data)
  end

  def read
    raise BufferEmptyException if empty?
    shift
  end

private

  def full?
    size == @max_size
  end
end
