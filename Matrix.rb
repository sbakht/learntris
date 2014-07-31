require_relative "Block"
require_relative "I_Block"
require_relative "O_Block"
require_relative "Z_Block"
require_relative "S_Block"
require_relative "J_Block"
require_relative "L_Block"
require_relative "T_Block"

class Matrix

	def initialize
		@matrix = @matrix = ". . . . . . . . . .\n" * 22
		@score = 0
		@numCleared = 0
		@rotations = 0
		@activeBlock = nil
	end

	def setCleared
		@matrix = Array.new(22) {Array.new(10,".")}
	end

	def setFromInput
		@matrix = ""
	    22.times do
	        @matrix = @matrix + gets.chomp + "\n"
	    end
	end

	def clearBlocks
		arr = @matrix.split("\n") #array of the matrix
		arr.each_with_index do |line, i|
			if !line.include?(".")
				arr[i] = ". . . . . . . . . ."
				incrementScore
				incrementNumCleared
			end
		end
		@matrix = arr.join("\n")
	end

	def show
		if @matrix.is_a?(Array) #turns into string if is an array
			@matrix.each do |line|
				puts line.join(' ')
			end
		else
			puts @matrix
		end
	end

	def showTest
		@activeBlock.testBlock
		@activeBlock.getTestMatrix.each do |line|
				puts line.join(' ')
		end
	end

	def showWithTetramino
		@activeBlock.spawn
		show
	end

	def printScore
		puts @score
	end

	def printNumCleared
		puts @numCleared
	end

	def incrementScore
		@score = @score + 100
	end

	def incrementNumCleared
		@numCleared = @numCleared + 1
	end

	def setActiveBlock(activeBlock)
		@activeBlock = activeBlock
	end

	def rotate
		@activeBlock.rotate
	end

	def moveLeft
		@activeBlock.move(0, -1)
	end

	def moveRight
		@activeBlock.move(0, 1)
	end

	def moveDown
		@activeBlock.move(1, 0)
	end

	def getMatrix
		return @matrix
	end

end