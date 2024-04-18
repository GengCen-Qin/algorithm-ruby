require_relative 'main'
class MainTest < TLDR
  def test_length_of_longest_substring
    s = 'abcabcbb'
    assert Main.length_of_longest_substring(s) == 3

    s = 'bbbbb'
    assert Main.length_of_longest_substring(s) == 1

    s = 'pwwkew'
    assert Main.length_of_longest_substring(s) == 3
  end
end
