
class I_Block < Block

	def initialize(instance)
		# @rotations = 0
		super
		@blockLetter = "c"
		@letterLoc = [[1,0],[1,1],[1,2],[1,3]]
		@testMatrix = [['.','.','.','.'],['.','.','.','.'],['.','.','.','.'],['.','.','.','.']]
		@matrix = @testMatrix
	end

	def rotate
		letterLocTemp = @letterLoc[0]
		removeBeforeRotate
		letter = "c"
		if @rotations == 0
			moveBlock(0, -1, 2, letterLocTemp, letter)
			moveBlock(1, 0, 2, letterLocTemp, letter)
			moveBlock(2, 1, 2, letterLocTemp, letter)
			moveBlock(3, 2, 2, letterLocTemp, letter)
			@rotations = 1
		elsif @rotations == 1
			moveBlock(0, 2, 1, letterLocTemp, letter)
			moveBlock(1, 2, 0, letterLocTemp, letter)
			moveBlock(2, 2, -1, letterLocTemp, letter)
			moveBlock(3, 2, -2, letterLocTemp, letter)
			@rotations = 2
		elsif @rotations == 2
			moveBlock(0, 1, -2, letterLocTemp, letter)
			moveBlock(1, 0, -2, letterLocTemp, letter)
			moveBlock(2, -1, -2, letterLocTemp, letter)
			moveBlock(3, -2, -2, letterLocTemp, letter)
			@rotations = 3
		elsif @rotations == 3
			moveBlock(0, -2, -1, letterLocTemp, letter)
			moveBlock(1, -2, 0, letterLocTemp, letter)
			moveBlock(2, -2, 1, letterLocTemp, letter)
			moveBlock(3, -2, 2, letterLocTemp, letter)
			@rotations = 4
		end
	end

end