require 'minitest/autorun'

require_relative 'sort'
require_relative 'array'

class SortTest < Minitest::Test
	def test_nothing
		assert(true)
	end

	def test_array_copy
		array = [1,2,3]
		copy = array.deep_copy

		copy[0] = 4
		
		assert_equal([4,2,3],copy)
		assert_equal([1,2,3],array)
	end

	def test_bubble
		arr = [5,1,3,2,4]
		copy = arr.deep_copy

		Sort.bubble(arr)
		copy.sort!

		assert_equal(arr,copy)
	end
end