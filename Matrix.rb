require_relative "Block"

class Matrix
	@matrix = ""
	@score = 0
	@numCleared = 0
	@activeTetramino = ""
	@letter1 = ""
	@letter2 = ""
	@letter3 = ""
	@letter4 = ""
	@rotations = 0
	@arrTetramino = []
	@letterLoc = [[],[],[],[]]

	def initialize
		@matrix = @matrix = ". . . . . . . . . .\n" * 22
		@score = 0
		@numCleared = 0
		@activeTetramino = ""
		@letter1 = ""
		@letter2 = ""
		@letter3 = ""
		@letter4 = ""
		@rotations = 0
		@arrTetramino = [['.','.','.','.'],['.','.','.','.'],['.','.','.','.'],['.','.','.','.']]
		@letterLoc = [[],[],[],[]]
	end

	def setCleared
		@matrix = ". . . . . . . . . .\n" * 22
	end

	def setFromInput
		@matrix = ""
	    22.times do
	        @matrix = @matrix + gets.chomp + "\n"
	    end
	end

	def clearBlocks
		arr = @matrix.split("\n") #array of the matrix
		arr.each_with_index do |line, i|
			if !line.include?(".")
				arr[i] = ". . . . . . . . . ."
				incrementScore
				incrementNumCleared
			end
		end
		@matrix = arr.join("\n")
	end

	def show
		puts @matrix
	end

	def printScore
		puts @score
	end

	def printNumCleared
		puts @numCleared
	end

	def incrementScore
		@score = @score + 100
	end

	def incrementNumCleared
		@numCleared = @numCleared + 1
	end

	def setActiveTetramino(char)
		@activeTetramino = char
		@matrix = [['.','.','.','.'],['.','.','.','.'],['.','.','.','.'],['.','.','.','.']]

		if @activeTetramino == "I"
			@letterLoc = [[1,0],[1,1],[1,2],[1,3]]
		end
		if @activeTetramino == "O"
			@letterLoc = [[0,0],[0,1],[1,0],[1,1]]
			# puts "y y"
			# puts "y y"
		end
		if @activeTetramino == "Z"
			@letterLoc = [[0,0],[0,1],[1,1],[1,2]]
			# puts "r r ."
			# puts ". r r"
			# puts ". . ."
		end
		if @activeTetramino == "S"
			@letter1 = [1,0]
			@letter2 = [2,0]
			@letter3 = [0,1]
			@letter4 = [1,1]
			# puts ". g g"
			# puts "g g ."
			# puts ". . ."
		end
		if @activeTetramino == "J"
			@letter1 = [0,0]
			@letter2 = [0,1]
			@letter3 = [1,1]
			@letter4 = [2,1]
			# puts "b . ."
			# puts "b b b"
			# puts ". . ."
		end
		if @activeTetramino == "L"
			@letter1 = [2,0]
			@letter2 = [0,1]
			@letter3 = [1,1]
			@letter4 = [2,1]
			# puts ". . o"
			# puts "o o o"
			# puts ". . ."
		end
		if @activeTetramino == "T"
			@letter1 = [1,0]
			@letter2 = [0,1]
			@letter3 = [1,1]
			@letter4 = [2,1]
			# puts ". m ."
			# puts "m m m"
			# puts ". . ."
		end
	end

	def rotate
		x = @letterLoc[0][0]
		y = @letterLoc[0][1]
		letterLocTemp = @letterLoc[0]
		removeBeforeRotate
		if @rotations == 0
			moveBlock(0, -1, 2, letterLocTemp)
			moveBlock(1, 0, 2, letterLocTemp)
			moveBlock(2, 1, 2, letterLocTemp)
			moveBlock(3, 2, 2, letterLocTemp)
			@rotations = 1
		elsif @rotations == 1
			moveBlock(0, 2, 1, letterLocTemp)
			moveBlock(1, 2, 0, letterLocTemp)
			moveBlock(2, 2, -1, letterLocTemp)
			moveBlock(3, 2, -2, letterLocTemp)
			@rotations = 2
		elsif @rotations == 2
			moveBlock(0, 1, -2, letterLocTemp)
			moveBlock(1, 0, -2, letterLocTemp)
			moveBlock(2, -1, -2, letterLocTemp)
			moveBlock(3, -2, -2, letterLocTemp)
			@rotations = 3
		elsif @rotations == 3
			moveBlock(0, -2, -1, letterLocTemp)
			moveBlock(1, -2, 0, letterLocTemp)
			moveBlock(2, -2, 1, letterLocTemp)
			moveBlock(3, -2, 2, letterLocTemp)
			@rotations = 4
		end

	end

	def printActiveTetramino
		if @activeTetramino == "I"
			if @rotations == 0
				@matrix = [['.','.','.','.'],['.','.','.','.'],['.','.','.','.'],['.','.','.','.']]
				@matrix[@letterLoc[0][0]][@letterLoc[0][1]] = "c"
				@matrix[@letterLoc[1][0]][@letterLoc[1][1]] = "c"
				@matrix[@letterLoc[2][0]][@letterLoc[2][1]] = "c"
				@matrix[@letterLoc[3][0]][@letterLoc[3][1]] = "c"
			end
			@matrix.each do |line|
				puts line.join(' ')
			end
			# print arr
			# puts ". . . ."
			# puts ". . . ."
			# puts "c c c c"
			# puts ". . . ."
		end
		if @activeTetramino == "O"
			puts "y y"
			puts "y y"
		end
		if @activeTetramino == "Z"
			puts "r r ."
			puts ". r r"
			puts ". . ."
		end
		if @activeTetramino == "S"
			puts ". g g"
			puts "g g ."
			puts ". . ."
		end
		if @activeTetramino == "J"
			puts "b . ."
			puts "b b b"
			puts ". . ."
		end
		if @activeTetramino == "L"
			puts ". . o"
			puts "o o o"
			puts ". . ."
		end
		if @activeTetramino == "T"
			puts ". m ."
			puts "m m m"
			puts ". . ."
		end
	end

	def removeBeforeRotate
		@matrix[@letterLoc[0][0]][@letterLoc[0][1]] = "."
		@matrix[@letterLoc[1][0]][@letterLoc[1][1]] = "."
		@matrix[@letterLoc[2][0]][@letterLoc[2][1]] = "."
		@matrix[@letterLoc[3][0]][@letterLoc[3][1]] = "."
	end

	def moveBlock(letterLocIndex, xMove, yMove, letterLocTemp)
		x = letterLocTemp[0]
		y = letterLocTemp[1]
		@matrix[x + xMove][y + yMove] = "c"
		@letterLoc[letterLocIndex] = [x + xMove, y + yMove]
	end

end