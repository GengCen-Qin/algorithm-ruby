# frozen_string_literal: true

# 动态规范-背包问题

# 输出二维数组
def puts_array(array)
  array.each do |row|
    puts row.join(' ')
  end
end

#
# 计算背包可容纳的最大价值
# @param materal [Array] 每件商品的重量和价值
# @param bag_size [Integer] 背包面积
# @return [Integer] 最大价值
def max_value(materal, bag_size)
  tmp_arr = Array.new(materal.size + 1) { Array.new(bag_size + 1, 0) }

  tmp_arr.each_index do |row_index|
    tmp_arr[row_index].each_index do |col_index|
      next if row_index.zero? || col_index.zero?

      materal_info = materal[row_index - 1]
      # 1. 上一行相同位置的价值
      last_value = tmp_arr[row_index - 1][col_index]
      # 2. 当前商品的价值 + （上一行当前列 - 当前商品的重量）
      now_value = if (col_index - materal_info[:weight]) >= 0
                    materal_info[:value] + tmp_arr[row_index - 1][col_index - materal_info[:weight]]
                  else
                    0
                  end

      tmp_arr[row_index][col_index] = [last_value, now_value].max
    end
  end

  tmp_arr.last.last
end
