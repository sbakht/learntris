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
		@matrix = ". . . . . . . . . .\n" * 22
		@score = 0
		@numCleared = 0
		@rotations = 0
		@activeBlock = nil
		@lockedBlocks = {}
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
			@lockedBlocks.each do |char, values|
				values.each do |coord|
					@matrix[coord[0]][coord[1]] = char
				end
			end
			if @activeBlock != nil && @lockedBlocks.length > 1
				@activeBlock.getLetterLoc.each do |letter|
					@matrix[letter[0]][letter[1]] = @activeBlock.getBlockLetter.upcase
				end
			end

			@matrix.each do |line|
				puts line.join(' ')
			end
		else
			puts @matrix
		end
	end

	def showWithUpcase
		if @matrix.is_a?(Array) #turns into string if is an array
			@lockedBlocks.each do |char, values|
				values.each do |coord|
					@matrix[coord[0]][coord[1]] = char.upcase
				end
			end
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
		if @activeBlock != nil
			@activeBlock.spawn
			if @lockedBlocks.length == 1
				showWithUpcase
			else
				show
			end
		else
			show
		end
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
		if @activeBlock != nil
			@activeBlock.move(1, 0)
		end
	end

	def moveToBottom
		22.times do
			if @activeBlock != nil
				@activeBlock.move(1, 0)
			end
		end
	end

	def getMatrix
		return @matrix
	end

	def getLockedBlocks
		return @lockedBlocks
	end
end