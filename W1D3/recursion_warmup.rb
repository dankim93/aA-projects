require 'byebug'

def range(start, finish)
  return [finish] if start == finish
  [start] + range(start + 1, finish)
end

# p range(1, 3)

def exp_1(num, exp)
  return 1 if exp == 0
  puts "num: #{num} | exp: #{exp}"
  num * exp_1(num, exp - 1)
end

def exp_2(num, exp)
  return 1 if exp.zero?
  if exp.even?
    return exp_2(num, exp/2) ** 2
  elsif exp.odd?
    return num * (exp_2(num, (exp - 1) / 2) ** 2)
  end
end
# p exp_2(2,3)


class Array
  def deep_dup
    #BASE CASE
    answer = []
    self.each_with_index do |el, idx|
      if el.is_a?(Array)
        answer << el.deep_dup
      else
        answer << el # change it to += maybe
      end
    end
    answer
  end

  def shallow_dup
    #BASE CASE
    answer = []
    self.each_with_index do |el, idx|
      answer << el
    end

    answer
  end
end


def fibonacci(n)
  if n == 1
    return [0]
  elsif n == 2
    return [0,1]
  end
  last_two = fibonacci(n - 1)
  last_two << (last_two.last + last_two[-2])
end

def my_permutation(arr)
  return [arr] if arr.length == 1
  first = arr.shift
  other_perms = my_permutation(arr)
  result = []
  other_perms.each do |perm|
    (0..perm.length).each do |idx|
      new_perm = perm[0...idx] + [first] + perm[idx..-1]
      result << new_perm
    end
  end
  result
end
# p my_permutation([1,2,3])

def bsearch(arr, target)
  return nil if arr.length == 1 && arr.first != target

  middle_val = arr[arr.length / 2]
  middle_idx = arr.length / 2
  if middle_val > target
    check = arr[0...middle_idx]
    return bsearch(check, target)
  elsif middle_val < target
    check = arr[middle_idx+1..-1]
    add = bsearch(check, target)
    return add + middle_idx + 1 if add
  else
    return middle_idx
  end
end

def merge_helper(arr1, arr2)
  arr1.concat(arr2).sort
end

def merge_sort(arr)
  return arr if arr.length < 2
  middle_idx = arr.length / 2
  left = arr[0...middle_idx]
  right = arr[middle_idx..-1]
  merge_helper(merge_sort(left), merge_sort(right))
end

def subsets(arr)
  return [[]] if arr.length < 1
  result = subsets(arr[0...-1])
  result + result.map { |subset| subset + [arr.last] }
end
# p subsets([1, 3, 4])

def make_changes(amount, coins=[25, 10, 5, 1])
  return [] if amount <= 0
  largest = coins.find { |coin| amount / coin > 0 }
  amount -= largest
  [largest] + make_changes(amount)
end

def better_changes(amount, coins=[25,10,5,1])
  return [] if amount == 0
  best_change = nil
  coins.each do |coin|
    next if coin > amount
    remainder = amount - coin
    current_change = better_changes(remainder, coins) + [coin]
    if best_change.nil? || current_change.length < best_change.length
      best_change = current_change
    end
  end
  
  best_change || []
end
# p better_changes(14, [10, 7, 1])
