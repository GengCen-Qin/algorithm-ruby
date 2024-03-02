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
end