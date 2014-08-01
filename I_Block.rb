
class I_Block < Block

	def initialize(instance)
		super
		@blockLetter = "c"
		@letterLoc = [[1,0],[1,1],[1,2],[1,3]]
		@testMatrix = [['.','.','.','.'],['.','.','.','.'],['.','.','.','.'],['.','.','.','.']]
		@matrix = @testMatrix
	end

	def rotate
		rotateBy = @letterLoc[0]
		removeBeforeRotate
		if @rotations == 0
			rotateLetter(0, -1, 2, rotateBy)
			rotateLetter(1, 0, 2, rotateBy)
			rotateLetter(2, 1, 2, rotateBy)
			rotateLetter(3, 2, 2, rotateBy)
			@rotations = 1
		elsif @rotations == 1
			rotateLetter(0, 2, 1, rotateBy)
			rotateLetter(1, 2, 0, rotateBy)
			rotateLetter(2, 2, -1, rotateBy)
			rotateLetter(3, 2, -2, rotateBy)
			@rotations = 2
		elsif @rotations == 2
			rotateLetter(0, 1, -2, rotateBy)
			rotateLetter(1, 0, -2, rotateBy)
			rotateLetter(2, -1, -2, rotateBy)
			rotateLetter(3, -2, -2, rotateBy)
			@rotations = 3
		elsif @rotations == 3
			rotateLetter(0, -2, -1, rotateBy)
			rotateLetter(1, -2, 0, rotateBy)
			rotateLetter(2, -2, 1, rotateBy)
			rotateLetter(3, -2, 2, rotateBy)
			@rotations = 0
		end
	end

end