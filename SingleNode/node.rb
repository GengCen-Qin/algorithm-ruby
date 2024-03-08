class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end

  def to_s
    @value
  end

  def to_str
    @value
  end

  def print_all()
    tmp = self
    while tmp
      p @value
      tmp = @next
    end
  end

  def self.reverse(node)
    return unless node

    tmp = node
    stack = []

    while tmp
      stack << tmp
      tmp = tmp.next
    end

    head = Node.new(-1)
    tmp = head
    until stack.empty?
      pop = stack.pop
      pop.next = nil
      tmp.next = pop
      tmp = tmp.next
    end

    head.next
  end

  def self.print_common_part(node1,node2) 
    map = {}
    tmp = node1
    set = Set.new
    while tmp
      set.add(tmp)
      tmp = tmp.next
    end

    tmp = node2
    while tmp 
      break if set.include?(tmp)      
      tmp = tmp.next
    end

    tmp
  end
end