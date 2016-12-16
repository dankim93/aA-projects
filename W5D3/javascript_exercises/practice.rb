def bsearch(arr, target)
  mid = arr.length/2
  midpoint = arr[mid]

  return mid if midpoint == target
  return nil if arr.length <=1

  if midpoint > target
    return bsearch(arr[0...mid])
  else
    return mid + bsearch(arr[mid..-1])
  end

end
