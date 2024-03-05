class Sort
	def self.bubble(array)
		size = array.size

		(size-1).times do |index|
			(0..size-2-index).each do |innerLoop|
				if (array[innerLoop] > array[innerLoop + 1]) 
					array[innerLoop+1],array[innerLoop] = array[innerLoop],array[innerLoop+1]
				end
			end
		end 


		array
	end

	def self.select(array) 
		bound = array.size-1
		bound.downto(0) do |down|
			maxIndex = 0
			0.upto(down) do |up|
				maxIndex = up if array[up] > array[maxIndex]
			end
			array[maxIndex],array[down] = array[down],array[maxIndex]
		end
	end

	def self.insert(array) 
		1.upto(array.size - 1) do |up|
			index = up
			while index > 0 and array[index-1] > array[index]
				swap(array,index,index-=1)
			end
		end
	end

	protected 

	def self.swap(array, x , y)
		array[x],array[y] = array[y],array[x]
	end
end