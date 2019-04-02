Node = Struct.new(:value, :left, :right)

module ZippableNode
  refine Node do
    attr_reader :up

    def set_up!(parent=nil)
      @up = parent
      right&.set_up!(self)
      left&.set_up!(self)
      self
    end
  end
end

class Zipper
  using ZippableNode

  def initialize(tree)
    @tree = tree.set_up!
    @focus = @tree
  end

  def value
    @focus.value
  end

  def right
    @focus = @focus.right
    self unless @focus.nil?
  end

  def left
    @focus = @focus.left
    self unless @focus.nil?
  end

  def up
    @focus = @focus.up
    self unless @focus.nil?
  end

  def set_value(value)
    @focus.value = value
    self
  end

  def set_left(value)
    @focus.left = value
    self
  end

  def set_right(value)
    @focus.right = value
    self
  end

  def to_tree
    @tree
  end

  def ==(zipper)
    to_tree == zipper.to_tree
  end

  def self.from_tree(tree)
    new(tree)
  end
end
