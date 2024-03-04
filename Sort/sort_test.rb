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
		checkSortSuccess(:bubble)	
	end

	def test_select
		checkSortSuccess(:select)		
	end

	private 

	def checkSortSuccess(sortName)
		array = Array.generate(10)
		copy = array.deep_copy

		Sort.send(sortName,array)
		copy.sort!

		assert_equal(copy,array)
	end
end