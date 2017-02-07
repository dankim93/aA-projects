require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(@start_idx + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[(@start_idx + index) % @capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length.zero?

    answer = self[@length - 1]
    self[@length - 1] = nil
    @length -= 1

    answer
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity

    @length += 1
    self[length - 1] = val

    nil
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length.zero?

    answer = self[0]
    self[0] = nil
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1

    answer
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @start_idx = (@start_idx - 1) % @capacity
    @length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    if (index < 0 || index >= @length)
      raise "index out of bounds"
    end
  end

  def resize!
    dcap = @capacity * 2
    dstore = StaticArray.new(dcap)
    for i in 0..@length-1
      dstore[i] = self[i]
    end

    @capacity = dcap
    @store = dstore
    @start_idx = 0

  end
end
