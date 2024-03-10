class Array
  def deep_copy
    Marshal.load(Marshal.dump(self))
  end

  def self.generate(size)
    array =	new(size)
    array.map! do |_value|
      value = rand(0..size)
    end
    array
  end
end
