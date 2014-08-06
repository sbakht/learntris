
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
			move = [[-1,2], [0,2], [1,2], [2,2]]
			@rotations = 1 if rotateLetter(move, rotateBy)
		elsif @rotations == 1
			move = [[2,1], [2,0], [2,-1], [2,-2]]
			@rotations = 2 if rotateLetter(move, rotateBy)
		elsif @rotations == 2
			move = [[1,-2], [0,-2], [-1,-2], [-2,-2]]
			@rotations = 3 if rotateLetter(move, rotateBy)
		elsif @rotations == 3
			move = [[-2,-1], [-2,0], [-2,1], [-2,2]]
			@rotations = 0 if rotateLetter(move, rotateBy)
		end
	end

end