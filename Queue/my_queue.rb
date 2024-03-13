class MyQueue
  # 这里使用栈结构来模拟队列
  def initialize
    @in = []
    @out = []
  end

  def push(value)
    if @out.empty?
      @in << value
    else
      @out << @in.pop until @in.empty?
      @in << value
    end
  end

  def pop
    @out << @in.pop until @in.empty? if @out.empty?

    @out.pop
  end
end
