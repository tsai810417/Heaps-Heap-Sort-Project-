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
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
