# frozen_string_literal: true

# 广度优先算法能解决两个问题
# 1. 从A能不能到B
# 2. 从A到B的使用最少的边

# 图本质上就是 一堆节点 + 一堆边组成
# 比如：a -> b, a -> c, b -> c, b -> d, d -> f
# 从上面的箭头可以看出这是有向图，即 a -> b，表明 a 到 b 间有一条边，但是只能从 a 到 b，不能从b到a
# 那我们可以通过Hash来表达
#
# key为当前节点，value为相邻节点，key-value的关联关系表示边
# graph_hash = {
#   a: [:b, :c],
#   b: [:c, :d],
#   d: [:f]
# }

# 广度优先算法本质上就是，先看离我最近的节点是不是目标，
# 如果是则说明到了，如果发现离我第一圈的节点都不是，那我再依次看第二圈的是不是，如果第二圈也没有，就去看第三圈
# 这个过程就能保证如果能找到重点，就表示A能到B，并且能找到从A到B最快的方式
# 需要注意，这里一定要保证第一圈找完，再去找第二圈，以此类推，那如何能做到呢？ 队列（FIFO）
# 在找第一圈时，判断一个节点不是，就把这个节点的邻居节点也加入到队列中
# ！！！还有一点指的注意，为了避免走进死胡同，比如 a -> b; b -> c; c -> a，按照上面的方式就会走进死循环，
# 所以我们还需要知道哪些节点已经处理了，哪些没有

# 广度优先搜索
# @param graph_hash [Hash] 图关系
# @param start [Symbol] 开始
# @param last [Symbol] 结束
# @return [Boolean] 是否能从开始走到结束
def bfs_search(graph_hash, start, last)
  # 已经检查过的节点
  checked = []
  # 队列
  queue = []

  # 把开始节点中的相邻节点添加入队列
  queue.concat graph_hash[start]

  result = false

  until queue.empty?
    node = queue.shift
    if node == last
      result = true
      break
    end

    checked << node
    queue.concat Array(graph_hash[node])
  end

  result
end
