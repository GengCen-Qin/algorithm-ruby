require 'minitest/autorun'
require_relative 'tree_node'

class TreeNodeTest < TLDR
  def setup 
    @node1 = TreeNode.new(1)
    node2 = TreeNode.new(2)
    node3 = TreeNode.new(3)
    node4 = TreeNode.new(4)
    node5 = TreeNode.new(5)
    node6 = TreeNode.new(6)
    node7 = TreeNode.new(7)

    @node1.left = node2
    @node1.right = node3

    node2.left = node4
    node2.right = node5

    node3.left = node6
    node3.right = node7
  end

  def test_new_treeNode
    node = TreeNode.new(-1)
    assert(node)
  end

  def test_print
    # TreeNode.pre_print(node1)

    # TreeNode.mid_print(node1)

    # TreeNode.aft_print(node1)
  end

  def test_width_print
    # TreeNode.width_print(@node1)
  end
end
