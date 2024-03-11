class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
  end

  def self.pre_print(node)
  	return unless node

  	print "#{node.value} "

  	pre_print(node.left)

  	pre_print(node.right)
  end
end
