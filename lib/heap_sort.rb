require_relative "heap"

class Array
  def heap_sort!
    # 1. make the array to become a valid max-heap map
    # 2. swap arr[0] to the end
    # 3. the length of the heap map - 1
    # 4. heapify down (pass a diff prc)
    # 5. repeat 2 - 4 until length == 0

    prc = Proc.new{ |a,b| b <=> a }
    idx = 1
    length = self.length
    while idx < length
      BinaryMinHeap.heapify_up(self, idx, idx + 1, &prc)
      idx += 1
    end
    sorted_length = 0
    until sorted_length == length
      BinaryMinHeap.swap(self, 0, length - sorted_length - 1)
      sorted_length += 1
      BinaryMinHeap.heapify_down(self, 0, length - sorted_length, &prc)
    end
    self
  end
end
