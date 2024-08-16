class SingleNode
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

  def print_all
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

    head = SingleNode.new(-1)
    tmp = head
    until stack.empty?
      pop = stack.pop
      pop.next = nil
      tmp.next = pop
      tmp = tmp.next
    end

    head.next
  end

  # 反转单链表
  # @param {SingleNode} node
  # @return {SingleNode}
  def self.reverse_v2(node)
    # 使用双指针来控制
    old_first = node
    slow = node
    fast = node.next

    while fast
      head = fast.next
      fast.next = slow
      slow = fast
      fast = head
    end
    old_first.next = nil

    slow
  end

  def self.print_common_part(node1, node2)
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

  def self.print_sorted_common_part(node1, node2)
    common = nil
    while node1 and node2
      if node1.value > node2.value
        node2 = node2.next
      elsif node1.value < node2.value
        node1 = node1.next
      else
        common = node1
        break
      end
    end
    common
  end

  def self.is_huiwen?(node)
    tmp = node
    stack = []
    while tmp
      stack << tmp
      tmp = tmp.next
    end

    tmp = node
    isHuiwen = true
    while tmp
      pop = stack.pop
      if tmp.value != pop.value
        isHuiwen = false
        break
      end
      tmp = tmp.next
    end

    isHuiwen
  end
end
