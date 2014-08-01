class Block

	def initialize(instance)
		@rotations = 0
		@instance = instance
		@testMatrix = [['.','.','.'],['.','.','.'],['.','.','.']]
		@matrix = @testMatrix
		@firstSpawn = true
	end

	def rotate
	end

	def move(y, x)
		# removeBeforeRotate
		initialzeSpawning
		good = true
		atMaxDepth = false
		@instance.getLockedBlocks.each do |key, values|
				values.each do |coord|
					@letterLoc.each do |letter|
						# print coord
						# puts
						# print letter
						# puts
						if coord == [letter[0] + y, letter[1]] && !@letterLoc.include?([letter[0] + y, letter[1]])
							good = false
							atMaxDepth = true
						end
					end
			end
		end

		@instance.getLockedBlocks.each do |lockedBlock|
			atMaxDepth = false if lockedBlock == @letterLoc
		end

		@letterLoc.each do |letter|
			good = false if (letter[1] + x < 0 || letter[1] + x >= 10) && @firstSpawn == false
			good = false if (letter[1] + x < -3 || letter[1] + x >= 7) && @firstSpawn == true


			if letter[0] + y >= 22
				good = false
				match = false

				if @instance.getLockedBlocks.length == 0
					@instance.getLockedBlocks[@blockLetter] = @letterLoc
				end
				@instance.getLockedBlocks.each do |key, values|
					match = true if values == @letterLoc
				end
				@instance.getLockedBlocks[@blockLetter] = @letterLoc if !match
				break
			end
		end

		@instance.getLockedBlocks[@blockLetter] = @letterLoc if atMaxDepth

		if good == true
			@letterLoc.each do |letter|
				letter[0] += y
				letter[1] += x
			end
		end
	end

	def moveBlock(letterLocIndex, xMove, yMove, letterLocTemp, letter)
		x = letterLocTemp[0]
		y = letterLocTemp[1]
		@letterLoc[letterLocIndex] = [x + xMove, y + yMove]
	end

	def removeBeforeRotate
		@matrix[@letterLoc[0][0]][@letterLoc[0][1]] = "."
		@matrix[@letterLoc[1][0]][@letterLoc[1][1]] = "."
		@matrix[@letterLoc[2][0]][@letterLoc[2][1]] = "."
		@matrix[@letterLoc[3][0]][@letterLoc[3][1]] = "."
	end

	def spawn
		initialzeSpawning
		@matrix = @instance.getMatrix
		@letterLoc.each do |letter|
			@matrix[letter[0]][letter[1]] = @blockLetter.upcase
		end
	end

	# def lockInBlock
	# 	initialzeSpawning
	# 	@matrix = @instance.getMatrix
	# 	@letterLoc.each do |letter|
	# 		# @matrix[letter[0]][letter[1]] = @blockLetter
	# 	end
	# 	# @instance.setActiveBlock(nil)
	# end

	def testBlock
		@matrix = @testMatrix
		@letterLoc.each do |letter|
			@matrix[letter[0]][letter[1]] = @blockLetter
		end
	end

	def getTestMatrix
		return @testMatrix
	end

	def getLetterLoc
		print @letterLoc
		print @firstSpawn
	end

	def initialzeSpawning
		if @firstSpawn == true
			@letterLoc.each do |letter|
				letter[1] += 3
			end
			@firstSpawn = false
		end
	end

	def getBlockLetter
		return @blockLetter
	end


end
