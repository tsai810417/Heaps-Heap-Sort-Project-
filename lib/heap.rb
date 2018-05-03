require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
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
    # if (a < b) prc.call => -1
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
        array =self.heapify_down(array, childs[0], len, &prc)
      end
    end
    return array
  end

  def self.swap(array, idx1, idx2)
    array[idx1], array[idx2] = array[idx2], array[idx1]
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
