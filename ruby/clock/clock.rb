class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24

  def initialize(hour: 0, minute: 0)
    @minutes = hour * MINUTES_PER_HOUR + minute
    @minutes %= HOURS_PER_DAY * MINUTES_PER_HOUR
  end

  def to_s
    hs, ms = @minutes.divmod(MINUTES_PER_HOUR)
    "%02d:%02d" % [hs % HOURS_PER_DAY, ms]
  end

  def ==(clock)
    @minutes == clock.minutes
  end

  def +(clock)
    self.class.new(minute: @minutes + clock.minutes)
  end

  def -(clock)
    self.class.new(minute: @minutes - clock.minutes)
  end

protected

  attr_accessor :minutes
end
