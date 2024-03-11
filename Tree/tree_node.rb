class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
  end

  # 先序遍历
  def self.pre_print(node)
    stack = []
    stack << node

    until stack.empty?
      node = stack.pop
      print "#{node.value} "

      stack << node.right if node.right
      stack << node.left if node.left
    end
  end

  # 中序遍历
  def self.mid_print(node); end

  # 后序遍历
  def self.aft_print(node)
    stack_in = []
    stack_out = []

    stack_in << node

    until stack_in.empty?
      pop = stack_in.pop
      stack_out << pop

      stack_in << pop.left if pop.left
      stack_in << pop.right if pop.right
    end

    p "#{stack_out.pop.value} " until stack_out.empty
  end
end
