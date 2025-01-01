# frozen_string_literal: true

require_relative 'bfs'
require_relative 'djs'

class GraphTest < TLDR
  def test_bfs_search
    graph_hash = {
      a: [:b, :c],
      b: [:c, :d],
      d: [:f]
    }

    start = :a
    last = :f

    assert bfs_search(graph_hash, start, last)
  end

  def test_djs_min_weigth
    node_hash = {
      a: [
        { b: 6 },
        { c: 2 }
      ],
      b: [
        { d: 1 }
      ],
      c: [
        { b: 3 },
        { d: 5 }
      ],
      d: []
    }

    graph = Graph.parse(node_hash)
    assert_equal graph.node_names, [:a, :b, :c, :d]

    assert_equal graph.briges.size, 5

    assert_equal graph.get_weight(:a, :b), 6

    assert_equal graph.djs_min_weigth(graph.get_node(:a), graph.get_node(:d)), 6
  end

  def test_djs_min_weigth
    node_hash = {
      a: [
        { b: 5 },
        { c: 9 }
      ],
      b: [
        { d: 15 },
        { e: 20 },
      ],
      c: [
        { e: 35 },
        { d: 20 }
      ],
      d: [
        { f: 20 }
      ],
      e: [
        { f: 10 }
      ],
      f: [
      ]
    }

    graph = Graph.parse(node_hash)
    assert_equal graph.djs_min_weigth(graph.get_node(:a), graph.get_node(:f)), 35
  end
end
