class Main
  # 无重复字符的最长子串
  # @param {String} str
  # @return {Integer}
  def self.length_of_longest_substring(str)
    # 维护一个数组或者字符串
    # 遍历原字符串的每一位，并向上述结构中插入
    # 插入前判断，如果已经存在，则将之前存在以及之前的字符全部删除
    # 如果不存在，则继续插入
    arr = []
    chars = str.split('')
    max_size = 0
    chars.each do |char|
      index = arr.index(char)
      arr.slice!(0..index) if index
      arr << char
      max_size = arr.size if arr.size > max_size
    end

    max_size
  end
end
