require_relative '../heap'

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

	def self.merge(array)
		doMerge(array,0,array.size-1)
	end

	def self.doMerge(array,start,button)
		if start == button
			return
		end

		mid = getMid(start,button)
		doMerge(array,start,mid)
		doMerge(array,mid + 1,button)

		# 左右两边都已经有序了
		# 创建一个临时空间
		tmpArr = []
		left = start
		right = mid + 1

		while left <= mid and right <= button 
			if array[left] < array[right]
				tmpArr << array[left]
				left+=1
			else 
				tmpArr << array[right]
				right+=1
			end
		end

		while left <= mid
			tmpArr << array[left]
			left+=1
		end

		while right <= button
			tmpArr << array[right]
			right+=1
		end

		# 临数数组内已经是两边有序的
		tmpArr.each_with_index do |value,index|
			array[index + start] = value
		end
	end

	def self.heap(array)
		heapObj = Heap.new(array)
		heapObj.sort
	end

	def self.fast(array)
		doFast(array,0,array.size - 1)
	end

	def self.doFast(array,left,right)
		# 快速排序是参考一个值，让整个数组变成 < = > 三个区，和荷兰国旗算法的思想一致
	    return if left >= right

	    # 我们以最右点的值来进行判定
	    l = left - 1
	    r = right 
	    target = array[right]
	    index = left

	    while l < r and index < r
	    	if array[index] > target
	    		swap(array,index,r - 1)
	    		r -= 1
	    	elsif array[index] < target
	    		swap(array,index,l + 1)
	    		l += 1
	    		index += 1
	    	else
	    		index += 1
	    	end
	    end

	    swap(array,right,r)

	    doFast(array,left,l);
	    doFast(array,r,right)
	end

	protected 

	def self.getMid(start,button) 
		start + ((button - start) >> 1)
	end

	def self.swap(array, x , y)
		array[x],array[y] = array[y],array[x]
	end
end