require_relative '../Heap/heap'

class Sort
  def self.bubble(array)
    size = array.size

    (size - 1).times do |index|
      (0..size - 2 - index).each do |innerLoop|
        if array[innerLoop] > array[innerLoop + 1]
          array[innerLoop + 1], array[innerLoop] = array[innerLoop], array[innerLoop + 1]
        end
      end
    end

    array
  end

  def self.select(array)
    bound = array.size - 1
    bound.downto(0) do |down|
      maxIndex = 0
      0.upto(down) do |up|
        maxIndex = up if array[up] > array[maxIndex]
      end
      array[maxIndex], array[down] = array[down], array[maxIndex]
    end
  end

  def self.insert(array)
    1.upto(array.size - 1) do |up|
      index = up
      swap(array, index, index -= 1) while index > 0 and array[index - 1] > array[index]
    end
  end

  def self.merge(array)
    doMerge(array, 0, array.size - 1)
  end

  def self.doMerge(array, start, button)
    return if start == button

    mid = getMid(start, button)
    doMerge(array, start, mid)
    doMerge(array, mid + 1, button)

    # 左右两边都已经有序了
    # 创建一个临时空间
    tmpArr = []
    left = start
    right = mid + 1

    while left <= mid and right <= button
      if array[left] < array[right]
        tmpArr << array[left]
        left += 1
      else
        tmpArr << array[right]
        right += 1
      end
    end

    while left <= mid
      tmpArr << array[left]
      left += 1
    end

    while right <= button
      tmpArr << array[right]
      right += 1
    end

    # 临数数组内已经是两边有序的
    tmpArr.each_with_index do |value, index|
      array[index + start] = value
    end
  end

  def self.heap(array)
    heapObj = Heap.new(array)
    heapObj.sort
  end

  # @param array [Array] Description.
  def self.fast(array)
    doQuick(array, 0, array.size - 1)
  end

  def self.doFast(array, left, right)
    # 快速排序是参考一个值，让整个数组变成 < = > 三个区，和荷兰国旗算法的思想一致
    return if left >= right

    # 我们以最右点的值来进行判定
    l = left - 1
    r = right
    target = array[right]
    index = left

    while l < r and index < r
      if array[index] > target
        swap(array, index, r - 1)
        r -= 1
      elsif array[index] < target
        swap(array, index, l + 1)
        l += 1
        index += 1
      else
        index += 1
      end
    end

    swap(array, right, r)

    doFast(array, left, l)
    doFast(array, r, right)
  end

  def self.doQuick(array, left, right)
    return if left >= right

    # 待比较的值
    pivot = array[getMid(left, right)]
    # 遍历下标
    left_index, right_index = left, right

    while left_index < right_index
      left_index += 1 while array[left_index] < pivot
      right_index -= 1 while array[right_index] > pivot
      break if left_index > right_index

      swap(array, left_index, right_index)
      left_index += 1
      right_index -= 1
    end

    doQuick(array, left, right_index)
    doQuick(array, left_index, right)
  end

  def self.getMid(start, button)
    start + ((button - start) >> 1)
  end

  def self.swap(array, x, y)
    array[x], array[y] = array[y], array[x]
  end

  # 桶排序
  def self.bucket(array)
    # 1. 找到最大值
    min = array.min
    # 2. 使用数组表示桶，下标表示桶的编号，值表示桶的个数
    tmp_bucket = []
    # 3. 遍历数组中每个元素，将放到下标对应的桶中
    array.each { |value| tmp_bucket[value - min] ||= 0 and tmp_bucket[value - min] += 1 }
    # 4. 将桶中的数据倒出来
    array.clear
    tmp_bucket.each_with_index do |value, index|
      next unless value

      value.times { array << (index + min) }
    end
  end
end
