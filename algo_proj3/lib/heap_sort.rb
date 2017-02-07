require_relative "heap"

class Array
  def heap_sort!
    for i in 2..count
      BinaryMinHeap.heapify_up(self, i - 1, i)
    end

    count.downto(2).each do |heap_sz|
      self[heap_sz - 1], self[0] = self[0], self[heap_sz - 1]
      BinaryMinHeap.heapify_down(self, 0, heap_sz - 1)
    end

    self.reverse!
  end
end
