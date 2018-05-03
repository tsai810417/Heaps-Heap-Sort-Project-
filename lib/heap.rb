require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @length = 0
  end

  def count
  end

  def extract
    BinaryMinHeap.swap(@store, 0, @length - 1)
    BinaryMinHeap.heapify_down(@store, 0, @length - 1)
    @length -= 1
    @store.pop
  end

  def peek
  end

  def push(val)
    @store.push(val)
    @length += 1
    BinaryMinHeap.heapify_up(@store, @length - 1, @length)
  end

  public
  def self.child_indices(len, parent_index)
    childs = [2 * parent_index + 1, 2 * parent_index + 2]
    if childs[0] >= len
      return []
    elsif childs[1] >= len
      return childs[0...1]
    else
      return childs
    end
  end

  def self.parent_index(child_index)
    if child_index != 0
      (child_index - 1) / 2
    else
      raise "root has no parent"
    end
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    # if (a < b), prc.call => -1
    prc ||= Proc.new { |a, b| a <=> b }
    childs = self.child_indices(len, parent_idx)

    if childs.length == 2
      if prc.call(array[childs[0]], array[childs[1]]) <= 0
        if prc.call(array[parent_idx], array[childs[0]]) > 0
          self.swap(array, parent_idx, childs[0])
          array = self.heapify_down(array, childs[0], len, &prc)
        end
      else
        if prc.call(array[parent_idx], array[childs[1]]) > 0
          self.swap(array, parent_idx, childs[1])
          array = self.heapify_down(array, childs[1], len, &prc)
        end
      end
    elsif childs.length == 1
      if prc.call(array[parent_idx], array[childs[0]]) > 0
        self.swap(array, parent_idx, childs[0])
        array = self.heapify_down(array, childs[0], len, &prc)
      end
    end
    return array
  end


  def self.heapify_up(array, child_idx, len = array.length, &prc)
    # if (a < b), prc.call => -1
    prc ||= Proc.new{ |a,b| a <=> b }
    unless child_idx == 0
    parent_idx = self.parent_index(child_idx)
      if prc.call(array[parent_idx], array[child_idx]) > 0
        self.swap(array, parent_idx, child_idx)
        array = self.heapify_up(array, parent_idx, len, &prc)
      end
    end

    return array
  end

  def self.swap(array, idx1, idx2)
    array[idx1], array[idx2] = array[idx2], array[idx1]
  end
end
