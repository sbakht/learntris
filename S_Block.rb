
class S_Block < Block

	def initialize(instance)
		super
		@blockLetter = "g"
		@letterLoc = [[0,1],[0,2],[1,0],[1,1]]
	end

	def rotate
		rotateBy = @letterLoc[3]
		removeBeforeRotate
		if @rotations == 0
			rotateLetter(0, -1, 0, rotateBy)
			rotateLetter(1, 0, 1, rotateBy)
			rotateLetter(2, 1, 1, rotateBy)
			rotateLetter(3, 0, 0, rotateBy)
			@rotations = 1
		elsif @rotations == 1
			rotateLetter(0, 0, 1, rotateBy)
			rotateLetter(1, 1, 0, rotateBy)
			rotateLetter(2, 1, -1, rotateBy)
			rotateLetter(3, 0, 0, rotateBy)
			@rotations = 2
		elsif @rotations == 2
			rotateLetter(0, 0, -1, rotateBy)
			rotateLetter(1, 1, 0, rotateBy)
			rotateLetter(2, -1, -1, rotateBy)
			rotateLetter(3, 0, 0, rotateBy)
			@rotations = 3
		elsif @rotations == 3
			rotateLetter(0, 0, -1, rotateBy)
			rotateLetter(1, -1, 1, rotateBy)
			rotateLetter(2, -1, 0, rotateBy)
			rotateLetter(3, 0, 0, rotateBy)
			@rotations = 0
		end
	end

end