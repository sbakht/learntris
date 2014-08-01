
class J_Block < Block

	def initialize(instance)
		super
		@blockLetter = "b"
		@letterLoc = [[0,0],[1,0],[1,1],[1,2]]
	end

	def rotate
		rotateBy = @letterLoc[2]
		removeBeforeRotate
		if @rotations == 0
			rotateLetter(0, -1, 1, rotateBy)
			rotateLetter(1, -1, 0, rotateBy)
			rotateLetter(2, 0, 0, rotateBy)
			rotateLetter(3, 1, 0, rotateBy)
			@rotations = 1
		elsif @rotations == 1
			rotateLetter(0, 0, -1, rotateBy)
			rotateLetter(1, 0, 1, rotateBy)
			rotateLetter(2, 0, 0, rotateBy)
			rotateLetter(3, 1, 1, rotateBy)
			@rotations = 2
		elsif @rotations == 2
			rotateLetter(0, -1, 0, rotateBy)
			rotateLetter(1, 1, 0, rotateBy)
			rotateLetter(2, 0, 0, rotateBy)
			rotateLetter(3, 1, -1, rotateBy)
			@rotations = 3
		elsif @rotations == 3
			rotateLetter(0, 0, 1, rotateBy)
			rotateLetter(1, -1, -1, rotateBy)
			rotateLetter(2, 0, 0, rotateBy)
			rotateLetter(3, 0, -1, rotateBy)
			@rotations = 0
		end
	end

end