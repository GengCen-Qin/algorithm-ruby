# frozen_string_literal: true

# 迪杰斯特拉算法
# 为什么需要它呢？
#
# 广度优先算法的缺点：只能确保找到最少的边数，但如果边上拥有权重的定义，那最少的边不一定权重是最少的
# 这里的权重可以指：时间，费用等等。比如最快时间内到达终点，或花费最少的钱到达终点
#
# ！！！注意： 迪杰斯特拉算法只适合无环图，并且权重不为负数的。

# 这里设计一个通用图结构
# 一个图中有多个节点
# 每个节点中记载，自己能到达哪些节点
# 一个图中有多个边
# 每个边记录起始点 和 重点，并记录权重值

# 节点
class Node

  # 节点名称
  # @return [String]
  attr_accessor :name

  # 能到达的节点
  # @return [Array[Node]]
  attr_accessor :next_nodes

  def initialize(name)
    self.name = name
    self.next_nodes = []
  end

  # 添加可到达的节点
  # @param next_node [Node] 可到达的节点
  def add_next(next_node)
    next_nodes << next_node
  end

  # 获取节点名称
  def to_s
    name
  end

  def inspect
    name
  end
end

# 边
class Brige
  attr_accessor :start_node, :end_node, :weight

  def initialize(start_node, end_node, weight = 0)
    self.start_node = start_node
    self.end_node = end_node
    self.weight = weight
  end

  def inspect
    "#{start_node.name} - #{weight} -> #{end_node.name}"
  end
end

# 图
class Graph

  # 节点集合
  # @return [Array[Node]]
  attr_accessor :nodes

  # 边集合
  # @return [Array[Brige]]
  attr_accessor :briges

  # 初始化
  # @param nodes [Array[Node]] 节点集合
  # @param briges [Array[Brige]] 边集合
  def initialize(nodes, briges)
    self.nodes = nodes
    self.briges = briges
  end

  #
  # 将Hash转成图结构
  # @param graph_hash [Hash] 使用Hash表示的图.
  # @return [Graph] 标准图结构
  #
  def self.parse(graph_hash)
    nodes = []
    briges = []

    nodes.concat(graph_hash.keys.map { |name| Node.new(name) })

    graph_hash.each_pair do |key, value|
      start_node = nodes.find { |node| node.name == key }
      value.each do |next_node|
        next_node.each_pair do |ikey, ivalue|
          end_node = nodes.find { |node| node.name == ikey }

          start_node.add_next(end_node)
          briges << Brige.new(start_node, end_node, ivalue)
        end
      end
    end

    new(nodes, briges)
  end

  #
  # 迪杰斯特拉算法-获取从开始节点到结束节点最短记录
  # @param start_node [Node] 开始节点.
  # @param end_node [Node] 结束节点.
  # @return [Integer] 最少权重值
  def djs_min_weigth(start_node, end_node)
    # 各个节点及到达所需要花费最小权重
    distance_hash = nodes.reduce({}) do |accessor, node|
      accessor.store node, 100
      accessor
    end

    # 已经使用过的节点
    used_nodes = [start_node]

    # 计算开始节点所能到达的节点
    start_node.next_nodes.each do |next_node|
      distance_hash[next_node] = get_weight(start_node.name, next_node.name)
    end

    until used_nodes.size == nodes.size
      # 找到最小权重并且没有被使用的节点
      min_weight_node = distance_hash.reject { |k, _v| used_nodes.include? k }.min_by { |_k, v| v }.first

      # 查看从这个节点到子节点的距离，并更新记录
      min_weight_node.next_nodes.each do |next_node|
        # 获取边距离
        now_weight = get_weight(min_weight_node.name, next_node.name)
        # 加上到到该节点本身的距离
        now_weight += distance_hash[min_weight_node]
        # 判断权重是否小了，如果小了就更新
        distance_hash[next_node] = [now_weight, distance_hash[next_node]].min
      end

      used_nodes << min_weight_node
    end

    distance_hash[end_node]
  end

  # 获取节点名称
  def node_names
    nodes.map(&:to_s)
  end

  # 获取开始节点到结束节点的权重
  # @param start_node [Symbol] 开始节点.
  # @param end_node [Symbol] 结束节点.
  # @return [Integer] 权重值
  def get_weight(start_node, end_node)
    briges.find { |brige| brige.start_node.name == start_node && brige.end_node.name == end_node }.weight
  end

  # 获取指定名称节点
  # @param name [Symbol] 节点名称.
  # @return [Node] 节点
  def get_node(name)
    nodes.find { |node| node.name == name }
  end
end
