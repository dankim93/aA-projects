def sum_to(n)
  return 1 if n == 1
  n + sum_to(n - 1)
end
# p sum_to(5)

def add_numbers(nums_array)
  return nums_array.first if nums_array.length == 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end
# p add_numbers([1,2,3,4,5])

def gamma(n)
  return 1 if n == 1
  # return 1 if n.zero?
  (n - 1) * gamma(n - 1)
end
p gamma(4)
