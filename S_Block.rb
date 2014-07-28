
class S_Block < Block

	def initialize(instance)
		super
		@blockLetter = "g"
		@letterLoc = [[0,1],[0,2],[1,0],[1,1]]
	end

	def rotate
		letterLocTemp = @letterLoc[3]
		removeBeforeRotate
		letter = "g"
		if @rotations == 0
			moveBlock(0, -1, 0, letterLocTemp, letter)
			moveBlock(1, 0, 1, letterLocTemp, letter)
			moveBlock(2, 1, 1, letterLocTemp, letter)
			moveBlock(3, 0, 0, letterLocTemp, letter)
			@rotations = 1
		elsif @rotations == 1
			moveBlock(0, 0, 1, letterLocTemp, letter)
			moveBlock(1, 1, 0, letterLocTemp, letter)
			moveBlock(2, 1, -1, letterLocTemp, letter)
			moveBlock(3, 0, 0, letterLocTemp, letter)
			@rotations = 2
		elsif @rotations == 2
			moveBlock(0, 0, -1, letterLocTemp, letter)
			moveBlock(1, 1, 0, letterLocTemp, letter)
			moveBlock(2, -1, -1, letterLocTemp, letter)
			moveBlock(3, 0, 0, letterLocTemp, letter)
			@rotations = 3
		end
	end

end