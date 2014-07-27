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
		@arrTetramino = []
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
		if @activeTetramino == "I"
			@letterLoc = [[1,0],[1,1],[1,2],[1,3]]
			@letter1 = [1,0]
			@letter2 = [1,1]
			@letter3 = [1,2]
			@letter4 = [1,3]
		end
		if @activeTetramino == "O"
			@letter1 = [0,0]
			@letter2 = [1,0]
			@letter3 = [0,1]
			@letter4 = [1,1]
			# puts "y y"
			# puts "y y"
		end
		if @activeTetramino == "Z"
			@letter1 = [0,0]
			@letter2 = [1,0]
			@letter3 = [1,1]
			@letter4 = [2,2]
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
		@arrTetramino = [['.','.','.','.'],['.','.','.','.'],['.','.','.','.'],['.','.','.','.']]
		x = @letter1[0]
		y = @letter1[1]
		if @rotations == 0
			@arrTetramino[x - 1][y + 2] = "c"
			@arrTetramino[x][y + 2] = "c"
			@arrTetramino[x + 1][y + 2] = "c"
			@arrTetramino[x + 2][y + 2] = "c"
			@letter1 = [x - 1, y + 2]
			# @letter1 = [x - 1, x + 2]
			@rotations = 1
		elsif @rotations == 1
			@arrTetramino[x + 2][y + 1] = "c"
			@arrTetramino[x + 2][y] = "c"
			@arrTetramino[x + 2][y - 1] = "c"
			@arrTetramino[x + 2][y - 2] = "c"
			@letter1 = [x + 2, y + 1]
			@rotations = 2
		elsif @rotations == 2
			@arrTetramino[x + 1][y - 2] = "c"
			@arrTetramino[x][y - 2] = "c"
			@arrTetramino[x - 1][y - 2] = "c"
			@arrTetramino[x - 2][y - 2] = "c"
			@letter1 = [x + 1, y - 2]
			@rotations = 3
		elsif @rotations == 3
			@arrTetramino[x - 2][y - 1] = "c"
			@arrTetramino[x - 2][y] = "c"
			@arrTetramino[x - 2][y + 1] = "c"
			@arrTetramino[x - 2][y + 2] = "c"
			@letter1 = [@letter1[0] - 2, @letter1[1] - 1]
			@rotations = 0
		end

	end

	def printActiveTetramino
		if @activeTetramino == "I"
			if @rotations == 0
				@arrTetramino = [['.','.','.','.'],['.','.','.','.'],['.','.','.','.'],['.','.','.','.']]
				@arrTetramino[@letter1[0]][@letter1[1]] = "c"
				@arrTetramino[@letter2[0]][@letter2[1]] = "c"
				@arrTetramino[@letter3[0]][@letter3[1]] = "c"
				@arrTetramino[@letter4[0]][@letter4[1]] = "c"
			end
			@arrTetramino.each do |line|
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

end