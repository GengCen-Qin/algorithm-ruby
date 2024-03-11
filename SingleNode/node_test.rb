require 'minitest/autorun'
require_relative 'node'
class NodeTest < TLDR
  def setup
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
    @node4 = Node.new(4)
    @node5 = Node.new(5)
    @node6 = Node.new(6)

    @node1.next = @node2
    @node2.next = @node3
    @node3.next = @node4
    @node4.next = @node5
    @node5.next = @node6
  end

  def test_nothing
    assert true
  end

  def test_reverse
    head = Node.reverse(@node1)

    assert head == @node6

    head = head.next while head.next

    assert head == @node1
    assert head.next.nil?
  end

  def test_print_common_part
    # 打印公共部分
    otherNode = Node.new(-1)
    otherNode.next = @node3

    common = Node.print_common_part(@node1, otherNode)

    assert common == @node3
  end

  def test_print_sorted_common_part
    # 打印两个有序链表的公共部分
    otherNode = Node.new(-1)
    otherNode.next = @node3

    common = Node.print_sorted_common_part(@node1, otherNode)

    assert common == @node3
  end

  def test_is_huiwen?
    refute Node.is_huiwen?(@node1)

    @node4.value = 3
    @node5.value = 2
    @node6.value = 1

    assert Node.is_huiwen?(@node1)
  end
end
