class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    if @store[num]
      false
    else
      @store[num] = true
    end
  end

  def remove(num)
    validate!(num)
    if include?(num)
      @store[num] = false
    end
    num
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num <= @store.length - 1 && num >= 0 ? true : false
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if include?(num)
      return false
    else
      self[num] << num
    end

    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if include?(num)
      return false
    else
      self[num] << num
      @count += 1
      resize! if num_buckets < @count
    end

    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |num| insert(num) }
  end
end
