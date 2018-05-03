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

class EasyMedian
  attr_accessor :min_heap, :max_heap
  def initialize
    prc = Proc.new{ |a,b| b <=> a }
    @length = 0
    @min_heap = BinaryMinHeap.new()
    @max_heap = BinaryMinHeap.new(&prc)
  end

  def add(val)
    if @length == 0
      @min_heap.push(val)
    elsif val <= @min_heap.peek
      @max_heap.push(val)
    else
      @min_heap.push(val)
    end
    @length += 1
    EasyMedian.check(@max_heap, @min_heap)
    p @max_heap
    p @min_heap
  end

  def find_median
    if @length.even?
      (@max_heap.peek + @min_heap.peek) / 2
    elsif @max_heap.length > @min_heap.length
       @max_heap.peek
    else
      @min_heap.peek
    end
  end

  private

  def self.check(max_heap, min_heap)
    if min_heap.length == max_heap.length + 2
      max_heap.push(min_heap.extract)
    elsif max_heap.length == min_heap.length + 2
      min_heap.push(max_heap.extract)
    end
  end
end

test = EasyMedian.new
test.add(8)
p "-----------"
p "I am median #{test.find_median()}"
test.add(16)
p "-----------"
p "I am median #{test.find_median()}"
test.add(4)
p "-----------"
p "I am median #{test.find_median()}"
