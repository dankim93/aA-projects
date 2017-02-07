require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if length <= 0
    answer = self[@length - 1]
    self[@length - 1] = nil
    @length -= 1

    answer
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    self.length += 1
    self[length - 1] = val

    nil
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length.zero?
    answer = self[0]
    (1...@length).each { |i| self[i - 1] = self[i] }
    @length -= 1

    answer
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity

    @length += 1
    (@length - 2).downto(0).each { |i| self[i+1] = self[i] }
    self[0] = val

    nil
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    if (index >= @length || index < 0)
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    dcap = @capacity * 2
    dstore = StaticArray.new(dcap)

    for i in 0...@length
      dstore[i] = self[i]
    end

    self.capacity = dcap
    self.store = dstore
  end
end
