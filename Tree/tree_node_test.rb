require 'minitest/autorun'
require_relative 'tree_node'

class TreeNodeTest < TLDR
  def test_new_treeNode
    node = TreeNode.new(-1)
    assert(node)
  end
end
