# frozen_string_literal: true

require_relative 'dynamic'

class GraphNodeTest < TLDR
  def test_bag
    # 背包总大小
    bag_size = 6
    # 商品 => 重量/价值
    materal = [
      {
        value: 10,
        weight: 3
      },
      {
        value: 3,
        weight: 1
      },
      {
        value: 9,
        weight: 2
      },
      {
        value: 5,
        weight: 2
      },
      {
        value: 6,
        weight: 1
      },
    ]
    assert_equal(max_value(materal, bag_size), 25)
  end
end
