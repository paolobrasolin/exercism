class Deque
  Element = Struct.new(:value, :prev, :next)

  def initialize
    @first = nil
    @last = nil
  end

  def push(value)
    Element.new(value, @last, nil).tap do |pushed|
      @last&.next = pushed
      @last = pushed
      @first ||= @last
    end
  end

  def unshift(value)
    Element.new(value, nil, @first).tap do |unshifted|
      @first&.prev = unshifted
      @first = unshifted
      @last ||= @first
    end
  end

  def pop
    @last.tap do |popped|
      popped.prev&.next = nil
      @last = popped.prev
      @first = nil if @last.nil?
    end.value
  end

  def shift
    @first.tap do |shifted|
      shifted.next&.prev = nil
      @first = shifted.next
      @last = nil if @first.nil?
    end.value
  end
end
