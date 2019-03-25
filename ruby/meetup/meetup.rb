require 'date'

class Meetup
  WDAYS = [:sunday,
    :monday, :tuesday, :wednesday,
    :thursday, :friday, :saturday]

  ORDINALS = [
    :first, :second, :third, :fourth, :fifth]

  def initialize(month, year)
    @date = Date.new(year, month)
  end
  
  def day(wday, descriptor)
    case descriptor
    when *ORDINALS
      nth_wday_from(ORDINALS.index(descriptor), wday, @date)
    when :last
      nth_wday_from(0, wday, @date.next_month - 7)
    when :teenth
      nth_wday_from(0, wday, @date + 12)
    end
  end

private

  def nth_wday_from(n, wday, date)
    offset = (WDAYS.index(wday) - date.wday) % 7
    date + offset + 7 * n
  end
end
