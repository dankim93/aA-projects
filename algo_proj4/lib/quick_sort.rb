class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 1

    new_pivot_idx = array.first
    temp = array[0]
    array[0] = array[new_pivot_idx]
    array[new_pivot_idx] = temp

    pivot_num = array.first
    left = []
    right = []
    array.each do |n|
      if pivot_num >= n
        left.push(n)
      else
        right.push(n)
      end
    end

    QuickSort.sort1(left) + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return array if length <= 1

    pivot_idx = partition(array, start, length, &prc)

    QuickSort.sort2!(array, start, pivot_idx - start, &prc)
    QuickSort.sort2!(array, pivot_idx + 1, length - pivot_idx + start - 1, &prc)

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    pivot_idx = start
    pivot_num = array[start]

    ((pivot_idx + 1)..(pivot_idx + length - 1)).each do |idx|
      if prc.call(pivot_num, array[idx]) > 0
        temp = array[idx]
        array[idx] = array[pivot_idx + 1]
        array[pivot_idx + 1] = temp
        pivot_idx += 1
      end
    end
    temp = array[start]
    array[start] = array[pivot_idx]
    array[pivot_idx] = temp

    pivot_idx
  end

end
