class Stack
   def initialize
     # create ivar to store stack here!
     @stack = []

   end

   def add(el)
     # adds an element to the stack
     @stack << el
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
stack = Stack.new
5.times { p stack.add("a") }
p stack.show
