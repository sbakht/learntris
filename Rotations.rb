	def rotateI
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

	def rotateZ
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

	def rotateS
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


	def rotateJ
		letterLocTemp = @letterLoc[2]
		removeBeforeRotate
		letter = "b"
		if @rotations == 0
			moveBlock(0, -1, 1, letterLocTemp, letter)
			moveBlock(1, -1, 0, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 1, 0, letterLocTemp, letter)
			@rotations = 1
		elsif @rotations == 1
			moveBlock(0, 0, -1, letterLocTemp, letter)
			moveBlock(1, 0, 1, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 1, 1, letterLocTemp, letter)
			@rotations = 2
		elsif @rotations == 2
			moveBlock(0, -1, 0, letterLocTemp, letter)
			moveBlock(1, 1, 0, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 1, -1, letterLocTemp, letter)
			@rotations = 3
		end
	end

	def rotateL
		letterLocTemp = @letterLoc[2]
		removeBeforeRotate
		letter = "o"
		if @rotations == 0
			moveBlock(0, -1, 0, letterLocTemp, letter)
			moveBlock(1, 1, 0, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 1, 1, letterLocTemp, letter)
			@rotations = 1
		elsif @rotations == 1
			moveBlock(0, 0, -1, letterLocTemp, letter)
			moveBlock(1, 0, 1, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 1, -1, letterLocTemp, letter)
			@rotations = 2
		elsif @rotations == 2
			moveBlock(0, 1, 0, letterLocTemp, letter)
			moveBlock(1, -1, -1, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, -1, 0, letterLocTemp, letter)
			@rotations = 3
		end
	end

	def rotateT
		letterLocTemp = @letterLoc[2]
		removeBeforeRotate
		letter = "m"
		if @rotations == 0
			moveBlock(0, -1, 0, letterLocTemp, letter)
			moveBlock(1, 1, 0, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 0, 1, letterLocTemp, letter)
			@rotations = 1
		elsif @rotations == 1
			moveBlock(0, 0, -1, letterLocTemp, letter)
			moveBlock(1, 0, 1, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 1, 0, letterLocTemp, letter)
			@rotations = 2
		elsif @rotations == 2
			moveBlock(0, 1, 0, letterLocTemp, letter)
			moveBlock(1, -1, 0, letterLocTemp, letter)
			moveBlock(2, 0, 0, letterLocTemp, letter)
			moveBlock(3, 0, -1, letterLocTemp, letter)
			@rotations = 3
		end
	end