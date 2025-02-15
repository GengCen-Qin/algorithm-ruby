require_relative 'sort'
require_relative 'array'

class SortTest < TLDR
  def test_nothing
    assert(true)
  end

  def test_array_copy
    array = [1, 2, 3]
    copy = array.deep_copy

    copy[0] = 4

    assert_equal([4, 2, 3], copy)
    assert_equal([1, 2, 3], array)
  end

  def test_bubble
    check_sort_success(:bubble)
  end

  def test_select
    check_sort_success(:select)
  end

  def test_insert
    check_sort_success(:insert)
  end

  def test_merge
    check_sort_success(:merge)
  end

  def test_heap
    check_sort_success :heap
  end

  def test_fast
    check_sort_success :fast
  end

  def test_bucket
    check_sort_success :bucket
  end

  private

  def check_sort_success(sort_name)
    100.times do
      array = Array.generate(10)
      copy = array.deep_copy

      Sort.send(sort_name, array)
      copy.sort!

      assert_equal(copy, array)
    end
  end
end
