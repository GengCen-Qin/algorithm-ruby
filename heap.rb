class Heap 

	# 堆结构可以使用数组来模拟，而在逻辑上堆是一个完全二叉树
	# 这里以大根堆为例，大根堆结构为：所有父节点都比自己的子节点大，其中堆顶就是最大值

	attr_accessor :array,:heapSize

	# 数组 -> 二叉树
	# 当前节点的父节点:   (index - 1)  / 2
	# 当前节点的左子节点:  index * 2 + 1
	# 当前节点的右子节点:  index * 2 + 2
	
	def heapify(index)
		leftChild = index * 2 + 1
		while leftChild < heapSize
			maxIndex = leftChild
			if leftChild + 1 < heapSize
				maxIndex = array[leftChild] > array[leftChild + 1] ? leftChild : leftChild + 1
			end

			if array[maxIndex] > array[index]
				swap(maxIndex,index)
				leftChild = maxIndex * 2 + 1
				index = maxIndex
			else
				break
			end
		end
	end

	def heapInsert(value)
		lastIndex = heapSize
		array << value

		while array[lastIndex] > array[(lastIndex-1)/2]
			swap(lastIndex,(lastIndex-1)/2)
			lastIndex = (lastIndex-1)/2
		end

		heapSize += 1
	end

	def sort
		(heapSize - 1).downto(0) do |down|
			heapify(down)
		end

		# 调整为一个大根堆了
		# 将堆顶放入到最后一个点，并且把heapSize - 1，也就是最后一个点不再参与计算
		while heapSize > 0
			lastIndex = heapSize - 1
			array[0],array[lastIndex] = array[lastIndex],array[0]
			@heapSize = lastIndex

			heapify(0)
		end
	end

	def initialize(array)
		self.array = array
		self.heapSize = array.size
	end

	def [](index)
		array[index]
	end

	def []=(index,value)
		array[index] = value
	end

	def swap(x , y)
		array[x],array[y] = array[y],array[x]
	end
end