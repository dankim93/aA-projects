class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store.delete_at(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless num.between?(0, @store.length-1)
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    find_bucket(num) << num
  end

  def remove(num)
    find_bucket(num).delete(num)
  end

  def include?(num)
    find_bucket(num).include?(num)
  end

  private

  def find_bucket(num)    #return the bucket
    @store[num % @store.length]
  end

  def [](num)
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
    resize! if num_buckets <= num
    if !include?(num)
      find_bucket(num) << num
      @count += 1
    end
  end

  def remove(num)
    find_bucket(num).delete(num)
  end

  def include?(num)
    find_bucket(num).include?(num)
  end

  private

  def find_bucket(num)    #return the bucket
    @store[num % @store.length]
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) { Array.new }
  end
end
