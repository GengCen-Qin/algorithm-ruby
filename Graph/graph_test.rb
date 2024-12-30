# frozen_string_literal: true

require_relative 'bfs'

class GraphTest < TLDR
  def test_bfs_search()
    graph_hash = {
      a: [:b, :c],
      b: [:c, :d],
      d: [:f]
    }

    start = :a
    last = :f

    assert bfs_search(graph_hash, start, last)
  end
end
