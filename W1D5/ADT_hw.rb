class Stack
   def initialize
     # create ivar to store stack here!
     @stack = []

   end

   def add(el)
     # adds an element to the stack
     @stack.push(el)
   end

   def remove
     # removes one element from the stack
     @stack.pop
   end

   def show
     # return a copy of the stack
     @stack.dup
   end
 end
# stack = Stack.new
# 5.times { p stack.add("a") }
# p stack.show
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end
# queue = Queue.new
# queue.enqueue(3)
# queue.enqueue(2)
# queue.enqueue(1)
# queue.dequeue
# p queue.show

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map << [key, value] if !@map.any? { |k,v| k == key }
  end

  def lookup(key)
    @map.each { |k, v| return v if k == key }
    nil
  end

  def remove(key)
    @map = @map.map { |k,v| [k, v] if k != key }
    @map.delete(nil)
    @map
  end

  def show
    @map
  end
end
map = Map.new
# p map.assign(1,2)
# p map.assign(3,4)
# p map.lookup(1)
# p map.lookup(2)
# p map.remove(3)
# p map.show
