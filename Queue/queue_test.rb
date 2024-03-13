require_relative 'my_queue'

class QueueTest < TLDR
  def test_new_queue
    assert MyQueue.new
  end

  def test_fifo
    queue = MyQueue.new

    queue.push(1)
    queue.push(2)
    queue.push(3)

    assert_equal(1, queue.pop)
  end

  def test_fifo_two
    queue = MyQueue.new

    queue.push(1)
    queue.push(2)
    queue.pop
    queue.push(3)

    assert_equal(2, queue.pop)
  end
end
