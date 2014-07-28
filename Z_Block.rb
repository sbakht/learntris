
class Z_Block < Block

	def initialize(instance)
		super
		@blockLetter = "r"
		@letterLoc = [[0,0],[0,1],[1,1],[1,2]]
	end

	def rotate
		letterLocTemp = @letterLoc[2]
		removeBeforeRotate
		letter = "r"
		if @rotations == 0
			moveBlock(0, -1, 1, letterLocTemp, letter)
			moveBlock(1, 0, 1, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 1, 0, letterLocTemp, letter)
			@rotations = 1
		elsif @rotations == 1
			moveBlock(0, 0, -1, letterLocTemp, letter)
			moveBlock(1, 1, 0, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 1, 1, letterLocTemp, letter)
			@rotations = 2
		elsif @rotations == 2
			moveBlock(0, 1, -1, letterLocTemp, letter)
			moveBlock(1, 0, -1, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, -1, 0, letterLocTemp, letter)
			@rotations = 3
		end
	end

end