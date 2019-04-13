class Bucket
  attr_reader :size, :heft, :name

  def initialize(size, name: nil)
    @name = name
    @size = size
    @heft = 0
  end

  def fill
    @heft = @size
  end

  def dump
    @heft = 0
  end

  def empty?
    @heft == 0
  end

  def full?
    @heft == @size
  end

  def pour_into(bucket)
    delta = [bucket.size - bucket.heft, @heft].min
    @heft -= delta
    bucket.heft += delta
  end

protected

  attr_writer :heft
end

class BucketsSim
  attr_reader :moves

  def initialize(source, target, goal)
    @source = source
    @target = target
    @goal = goal
    @moves = 0
  end

  def run
    return unless moves.zero? # i.e. already ran
    run_shortcut! and return if can_shortcut?
    move until buckets.map(&:heft).include?(@goal)
  end

  def goal_bucket
    buckets[goal_bucket_index]
  end

  def other_bucket
    buckets[[1, 0][goal_bucket_index]]
  end

private

  def move
    if @source.empty?
      @source.fill
    elsif @target.full?
      @target.dump
    else
      @source.pour_into(@target)
    end
    @moves += 1
  end

  def can_shortcut?
    @target.size == @goal
  end

  def run_shortcut!
    @source.fill
    @target.fill
    @moves = 2
  end

  def buckets
    [@source, @target]
  end

  def goal_bucket_index
    buckets.map(&:heft).index(@goal)
  end
end

class TwoBucket
  def initialize(bucket_one_size, bucket_two_size, goal, first_bucket)
    buckets = build_buckets(bucket_one_size, bucket_two_size, first_bucket)
    @simulation = BucketsSim.new(*buckets, goal).tap(&:run)
  end

  def goal_bucket
    @simulation.goal_bucket.name
  end

  def other_bucket
    @simulation.other_bucket.heft
  end

  def moves
    @simulation.moves
  end

private

  def build_buckets(bucket_one_size, bucket_two_size, first_bucket)
    buckets = [['one', bucket_one_size], ['two', bucket_two_size]]
    buckets.reverse! if first_bucket == 'two'
    buckets.map! { |name, size| Bucket.new(size, name: name) }
  end
end
