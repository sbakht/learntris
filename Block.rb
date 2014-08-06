class Block

	def initialize(instance)
		@rotations = 0
		@instance = instance
		@testMatrix = [['.','.','.'],['.','.','.'],['.','.','.']]
		@matrix = @testMatrix
		@firstSpawn = true
		@tempLetterLoc = []
	end

	def rotate
	end

	def move(y, x)
		initializeSpawning
		good = true
		collision = false
		@instance.getLockedBlocks.each do |key, values|
				values.each do |coord|
					@letterLoc.each do |letter|
						if coord == [letter[0] + y, letter[1] + x] && !@letterLoc.include?([letter[0] + y, letter[1] + x])
							good = false
							collision = true
						end
						if coord == [letter[0] + y, letter[1]] && !@letterLoc.include?([letter[0] + y, letter[1]])
							good = false
							collision = true
							@instance.setActiveBlock(nil)
						end
					end
			end
		end

		@instance.getLockedBlocks.each do |lockedBlock|
			collision = false if lockedBlock == @letterLoc
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
				if !match
					(1..10).each do |i| #dic keys are block letters, so prevents repeating block error
						if !@instance.getLockedBlocks[@blockLetter * i]
							@instance.getLockedBlocks[@blockLetter * i] = @letterLoc
							break 
						end
					end
				end
				break
			end
		end

		if collision
			(1..10).each do |i| #dic keys are block letters, so prevents repeating block error
				if !@instance.getLockedBlocks[@blockLetter * i]
					@instance.getLockedBlocks[@blockLetter * i] = @letterLoc
					break 
				end
			end
		end

		if good == true
			@letterLoc.each do |letter|
				letter[0] += y
				letter[1] += x
			end
		end
	end

	def rotateLetter(move, rotateByLetter)
		y = rotateByLetter[0]
		x = rotateByLetter[1]
		if !@instance.getLockedBlocks.empty?
			@instance.getLockedBlocks.each do |key, values|
				move.each_with_index do |mv, i|
					values.each do |coord|
						if coord == [y + mv[0], x + mv[1]]
							@letterLoc = @tempLetterLoc
							return false
						end
					end
					@letterLoc[i] = [y + mv[0], x + mv[1]]
				end
			end
		else
			move.each_with_index do |mv, i|
				@letterLoc[i] = [y + mv[0], x + mv[1]]
			end	
		end	
		return true
	end

	def removeBeforeRotate
		@matrix[@letterLoc[0][0]][@letterLoc[0][1]] = "."
		@matrix[@letterLoc[1][0]][@letterLoc[1][1]] = "."
		@matrix[@letterLoc[2][0]][@letterLoc[2][1]] = "."
		@matrix[@letterLoc[3][0]][@letterLoc[3][1]] = "."
	end

	def spawn
		initializeSpawning
		@matrix = @instance.getMatrix
		@letterLoc.each do |letter|
			@matrix[letter[0]][letter[1]] = @blockLetter.upcase
		end
	end

	def testBlock
		@matrix = @testMatrix
		@letterLoc.each do |letter|
			@matrix[letter[0]][letter[1]] = @blockLetter
		end
	end

	def getTestMatrix
		return @testMatrix
	end

	def initializeSpawning
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

	def getLetterLoc
		return @letterLoc
	end

end
