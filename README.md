# 仓库介绍

本仓库是使用Ruby做一些数据结构与算法的习题练习

其中测试框架使用：https://github.com/tendersearls/tldr 

特点就是：
```ruby
class NodeTest < Minitest::Test
end
```
变为
```ruby
class NodeTest < TLDR
end
```

执行测试需要你下载对应的gem: `gem install tldr`

执行测试使用：`rake safe_tests`