class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  def initialize(elements=[])
    elements.
      map(&Element.method(:new)).
      each(&method(:push))
  end

  def push(element)
    @head = element.tap { |e| e.next = @head }
    self
  end

  def pop
    @head&.tap { |e| @head = e.next }
  end

  def reverse!
    elements = []
    while element = pop do elements << element end
    elements.each(&method(:push))
    self
  end

  def to_a
    element = @head
    [].tap do |data|
      until element.nil?
        data << element.datum
        element = element.next
      end
    end
  end
end
