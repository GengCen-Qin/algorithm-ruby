require 'minitest/autorun'
require_relative "node"
class NodeTest < Minitest::Test
	def test_nothing
		assert true
	end

	def test_reverse() 
		node1 = Node.new(1)
		node2 = Node.new(2)
		node3 = Node.new(3)
		node4 = Node.new(4)
		node5 = Node.new(5)
		node6 = Node.new(6)

		node1.next = node2
		node2.next = node3
		node3.next = node4
		node4.next = node5
		node5.next = node6

	    head = Node.reverse(node1)

	    assert head == node6

	    while head.next 
	    	head = head.next
	    end

	    assert head == node1
	    assert head.next.nil?
	end
end