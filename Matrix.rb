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
		if @matrix.is_a?(Array) #turns into string if is an array
			@matrix.each do |line|
				puts line.join(' ')
			end
		else
			puts @matrix
		end
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
			@letterLoc.each do |letter|
				@matrix[letter[0]][letter[1]] = "c"
			end
		end
		if @activeTetramino == "O"
			@matrix = [['.','.'],['.','.']]
			@letterLoc = [[0,0],[0,1],[1,0],[1,1]]
			@letterLoc.each do |letter|
				@matrix[letter[0]][letter[1]] = "y"
			end
			# puts "y y"
			# puts "y y"
		end
		if @activeTetramino == "Z"
			@matrix = [['.','.','.'],['.','.','.'],['.','.','.']]
			@letterLoc = [[0,0],[0,1],[1,1],[1,2]]
			@letterLoc.each do |letter|
				@matrix[letter[0]][letter[1]] = "r"
			end
			# puts "r r ."
			# puts ". r r"
			# puts ". . ."
		end
		if @activeTetramino == "S"
			@matrix = [['.','.','.'],['.','.','.'],['.','.','.']]
			@letterLoc = [[0,1],[0,2],[1,0],[1,1]]
			@letterLoc.each do |letter|
				@matrix[letter[0]][letter[1]] = "g"
			end
			# puts ". g g"
			# puts "g g ."
			# puts ". . ."
		end
		if @activeTetramino == "J"
			@matrix = [['.','.','.'],['.','.','.'],['.','.','.']]
			@letterLoc = [[0,0],[1,0],[1,1],[1,2]]
			@letterLoc.each do |letter|
				@matrix[letter[0]][letter[1]] = "b"
			end
			# puts "b . ."
			# puts "b b b"
			# puts ". . ."
		end
		if @activeTetramino == "L"
			@matrix = [['.','.','.'],['.','.','.'],['.','.','.']]
			@letterLoc = [[0,2],[1,0],[1,1],[1,2]]
			@letterLoc.each do |letter|
				@matrix[letter[0]][letter[1]] = "o"
			end
			# puts ". . o"
			# puts "o o o"
			# puts ". . ."
		end
		if @activeTetramino == "T"
			@matrix = [['.','.','.'],['.','.','.'],['.','.','.']]
			@letterLoc = [[0,1],[1,0],[1,1],[1,2]]
			@letterLoc.each do |letter|
				@matrix[letter[0]][letter[1]] = "m"
			end
			# puts ". m ."
			# puts "m m m"
			# puts ". . ."
		end
	end

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

	def rotate
		case @activeTetramino
		when "I"
			rotateI
		when "Z"
			rotateZ
		when "S"
			rotateS
		when "J"
			rotateJ
		when "L"
			rotateL
		when "T"
			rotateT
		end

	end

	def removeBeforeRotate
		@matrix[@letterLoc[0][0]][@letterLoc[0][1]] = "."
		@matrix[@letterLoc[1][0]][@letterLoc[1][1]] = "."
		@matrix[@letterLoc[2][0]][@letterLoc[2][1]] = "."
		@matrix[@letterLoc[3][0]][@letterLoc[3][1]] = "."
	end

	def moveBlock(letterLocIndex, xMove, yMove, letterLocTemp, letter)
		x = letterLocTemp[0]
		y = letterLocTemp[1]
		@matrix[x + xMove][y + yMove] = letter
		@letterLoc[letterLocIndex] = [x + xMove, y + yMove]
	end

end