class Block

	def initialize(instance)
		@rotations = 0
		@instance = instance
		@testMatrix = [['.','.','.'],['.','.','.'],['.','.','.']]
		@matrix = @testMatrix
	end

	def rotate
	end

	def move(x, y)
		removeBeforeRotate
		@letterLoc.each do |letter|
			letter[0] += x
			letter[1] += y
			@matrix[letter[0]][letter[1]] = @blockLetter.upcase
		end
	end

	def moveBlock(letterLocIndex, xMove, yMove, letterLocTemp, letter)
		x = letterLocTemp[0]
		y = letterLocTemp[1]
		@matrix[x + xMove][y + yMove] = letter
		@letterLoc[letterLocIndex] = [x + xMove, y + yMove]
	end

	def removeBeforeRotate
		@matrix[@letterLoc[0][0]][@letterLoc[0][1]] = "."
		@matrix[@letterLoc[1][0]][@letterLoc[1][1]] = "."
		@matrix[@letterLoc[2][0]][@letterLoc[2][1]] = "."
		@matrix[@letterLoc[3][0]][@letterLoc[3][1]] = "."
	end

	def spawn
		@matrix = @instance.getMatrix
		@letterLoc.each do |letter|
			letter[1] += 3
			@matrix[letter[0]][letter[1]] = @blockLetter.upcase
		end
	end

	def testBlock
		@matrix = @testMatrix
		@letterLoc.each do |letter|
			@matrix[letter[0]][letter[1]] = @blockLetter
		end
	end

	def getTestMatrix
		return @testMatrix
	end

end
