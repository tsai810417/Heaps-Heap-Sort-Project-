require_relative 'heap'

def k_largest_elements(array, k)
  prc = Proc.new{ |a,b| b <=> a }
  heap_map = BinaryMinHeap.new(&prc)
  # build heap map in O(n) time
  array.each do | el |
    heap_map.push(el)
  end
  # rea array is used to store each result of extract
  # iterate constant k times
  # worst case of deapify_down is O(log n), but only do it for k times
  res = []
  k.times do | i |
    res.unshift(heap_map.extract)
  end

  res
end
