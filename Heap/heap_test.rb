require 'minitest/autorun'
require_relative 'heap'
class HeapTest < TLDR
  def test_nothing
    assert true
  end

  def test_new_heap
    heap = Heap.new
    assert heap
  end
end
