class Robot
  STEPS = {
    north: [ 0, +1],
    east:  [+1,  0],
    south: [ 0, -1],
    west:  [-1,  0],
  }

  attr_reader :bearing, :coordinates

  def orient(direction)
    raise ArgumentError unless STEPS.keys.include?(direction)
    @bearing = direction
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def turn_right
    turn(+1)
  end

  def turn_left
    turn(-1)
  end

  def advance
    move(STEPS[@bearing])
  end

private

  def turn(ticks)
    @bearing = STEPS.keys.rotate(ticks)[STEPS.keys.index(@bearing)]
  end

  def move(steps)
    @coordinates = @coordinates.zip(steps).map(&:sum)
  end
end

class Simulator
  INSTRUCTIONS = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance,
  }

  def instructions(input)
    input.chars.map(&INSTRUCTIONS)
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, input)
    instructions(input).each(&robot.method(:send))
  end
end
