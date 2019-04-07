class Bst
  attr_reader :data, :left, :right

  def initialize(data=nil)
    @data = data
  end

  def insert(data)
    if @data.nil?
      @data = data
    elsif @data >= data
      (@left ||= self.class.new).insert(data)
    else
      (@right ||= self.class.new).insert(data)
    end
  end

  def each
    return sorted_data.to_enum unless block_given?
    sorted_data.each { |x| yield x }
  end

  def sorted_data
    [].tap do |list|
      list.concat(left.sorted_data) unless left.nil?
      list << data
      list.concat(right.sorted_data) unless right.nil?
    end
  end
end
