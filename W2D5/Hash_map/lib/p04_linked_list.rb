require 'byebug'
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    curr = @head
    count = 0

    until curr.key == key || curr == @tail
      curr = curr.next
      count += 1
    end

    curr == @tail ? nil : count
  end

  def include?(key)
    find_link(key) == @tail ? false : true
  end

  def append(key, val)
    link = Link.new(key, val)
    link.next = @tail
    link.prev = last

    last.next = link
    @tail.prev = link
  end

  def update(key, val)
    curr = find_link(key)
    curr.val = val unless curr == @tail
  end

  def find_link(key)
    curr = @head

    until curr.key == key || curr == @tail
      curr = curr.next
    end

    curr
  end

  def remove(key)
    link = find_link(key)
    return nil if link == @tail
  
    link.prev.next = link.next if link.prev
    link.next.prev = link.prev if link.next
  end

  def each
    curr = @head

    until curr == @tail
      yield(curr) unless curr.val.nil?
      curr = curr.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
