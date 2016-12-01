require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    find_bucket(key).include?(key)
  end

  def set(key, val)
    bucket = find_bucket(key)
    if bucket.include?(key)
      update(key, val)
    else
      bucket.append(key, val)
      @count += 1
    end
  end

  def get(key)
    
  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end



  def find_bucket(obj)    #return the bucket
    @store[obj.hash % @store.length]  #linked list
  end
end
