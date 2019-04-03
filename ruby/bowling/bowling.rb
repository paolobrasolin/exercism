class Game
  class Error < StandardError; end
  class BowlingError < Error; end

  def initialize
    @score = 0
    @frames = []
  end

  def roll(pins)
    raise BowlingError unless can_roll?
    raise BowlingError unless valid_pin_count?(pins)

    @frames << [] if @frames.none? || over?(@frames.last)

    @frames.last << pins
    raise BowlingError unless valid_pin_count?(@frames.last.sum)

    @score += pins * score_multiplier
  end

  def score
    raise BowlingError unless can_score?
    @score
  end

private

  def valid_pin_count?(pins)
    (0..10).include?(pins)
  end

  def score_multiplier
    # base score
    multiplier = 1
    # ordinary multipliers (not on fill balls)
    if fill_balls_count.zero?
      multiplier += 1 if spare?(@frames[-2]) && @frames.last.one?
      multiplier += 1 if strike?(@frames[-2])
      multiplier += 1 if strike?(@frames[-3]) && strike?(@frames[-2]) && @frames.last.one?
    end
    # perfect game
    multiplier += 1 if strike?(@frames[-3]) && fill_balls_count == 1
    multiplier
  end

  def fill_balls_count
    @frames[10..]&.sum(&:length) || 0
  end

  def can_roll?
    return true if strike?(@frames[9]) && fill_balls_count < 2
    return true if spare?(@frames[9]) && fill_balls_count < 1
    !over?(@frames[9])
  end

  def can_score?
    return !can_roll?
  end

  def over?(frame)
    return if frame.nil?
    frame.sum == 10 || frame.length == 2
  end

  def strike?(frame)
    return if frame.nil?
    frame.length == 1 && frame.sum == 10
  end

  def spare?(frame)
    return if frame.nil?
    frame.length == 2 && frame.sum == 10
  end
end
