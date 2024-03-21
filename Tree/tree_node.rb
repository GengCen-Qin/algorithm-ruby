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
  def self.mid_print(node)
    stack = []
    tmp = node
    while tmp
      stack << tmp
      tmp = tmp.left
    end

    until stack.empty?
      pop = stack.pop
      print "#{pop.value} "

      right = pop.right

      while right
        stack << right
        right = right.left
      end
    end
  end

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

    print "#{stack_out.pop.value} " until stack_out.empty?
  end

  def self.width_print(node)
    queue = []
    queue << node

    until queue.empty?
      tmp = queue.shift
      print "#{tmp.value} "

      queue << tmp.left if tmp.left
      queue << tmp.right if tmp.right
    end
  end
end
