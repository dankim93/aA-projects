require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if num_buckets <= count
    if !include?(key)
      find_bucket(key) << key
      @count += 1
    end
  end

  def include?(key)
    find_bucket(key).include?(key)
  end

  def remove(key)
    find_bucket(key).delete(key)
  end

  private

  # def [](key)
  #   # optional but useful; return the bucket corresponding to `key`
  # end

  def find_bucket(obj)    #return the bucket
    @store[obj.hash % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) { Array.new }
  end
end
