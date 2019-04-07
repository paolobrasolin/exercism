class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError unless sorted?(list)
    @list = list
  end

  def search_for(element, list=@list)
    raise RuntimeError if element < list.first
    raise RuntimeError if element > list.last
    bisearch(element).tap do |result|
      raise RuntimeError if result.nil?
    end
  end

  def middle
    @list.length.div(2) # ¯\_(ツ)_/¯
  end

private

  def bisearch(element, list=@list, bot=0, top=@list.size.pred)
    return bot if list[bot] == element
    return top if list[top] == element
    return if top - bot == 1

    mid = bot + (top - bot).div(2)
    case list[mid] <=> element
      when -1 then bisearch(element, list, mid, top)
      when  0 then mid
      when +1 then bisearch(element, list, bot, mid)
    end
  end

  def sorted?(list)
    list == list.sort
  end
end
