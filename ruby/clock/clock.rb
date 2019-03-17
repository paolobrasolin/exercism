class Clock
  MS_PER_H = 60
  HS_PER_D = 24

  def initialize(hour: 0, minute: 0)
    @minutes = hour * MS_PER_H + minute
    @minutes %= HS_PER_D * MS_PER_H
  end

  def to_s
    hs, ms = @minutes.divmod(MS_PER_H)
    "%02d:%02d" % [hs % HS_PER_D, ms]
  end

  def ==(clock)
    self.minutes == clock.minutes
  end

  def +(clock)
    self.class.new(minute: self.minutes + clock.minutes)
  end

  def -(clock)
    self.class.new(minute: self.minutes - clock.minutes)
  end

protected

  def minutes
    @minutes
  end
end
