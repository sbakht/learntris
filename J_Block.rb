
class J_Block < Block

	def initialize(instance)
		super
		@blockLetter = "b"
		@letterLoc = [[0,0],[1,0],[1,1],[1,2]]
	end

	def rotate
		rotateBy = @letterLoc[2]
		removeBeforeRotate
		@tempLetterLoc = @letterLoc.dup
		if @rotations == 0
			move = [[-1,1], [-1,0], [0,0], [1,0]]
			@rotations = 1 if rotateLetter(move, rotateBy)
		elsif @rotations == 1
			move = [[0,-1], [0,1], [0,0], [1,1]]
			@rotations = 2 if rotateLetter(move, rotateBy)
		elsif @rotations == 2
			move = [[-1,0], [1,0], [0,0], [1,-1]]
			@rotations = 3 if rotateLetter(move, rotateBy)
		elsif @rotations == 3
			move = [[0,1], [-1,-1], [0,0], [0,-1]]			
			@rotations = 0 if rotateLetter(move, rotateBy)
		end
	end

end