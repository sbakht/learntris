require_relative "Block"
require_relative "Rotations"

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
		@matrix = @matrix = Array.new(22) {Array.new(10,".")}
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

	def showWithTetramino
		case @activeTetramino
		when "O"
			@letterLoc.each do |letter|
				letter[1] += 4
				@matrix[letter[0]][letter[1]] = "Y"
			end
		when "L"
			@letterLoc.each do |letter|
				letter[1] += 3
				@matrix[letter[0]][letter[1]] = "O"
			end
		when "J"
			@letterLoc.each do |letter|
				letter[1] += 3
				@matrix[letter[0]][letter[1]] = "B"
			end
		when "Z"
			@letterLoc.each do |letter|
				letter[1] += 3
				@matrix[letter[0]][letter[1]] = "R"
			end
		when "S"
			@letterLoc.each do |letter|
				letter[1] += 3
				@matrix[letter[0]][letter[1]] = "G"
			end
		when "I"
			@letterLoc.each do |letter|
				letter[1] += 3
				@matrix[letter[0]][letter[1]] = "C"
			end
		when "T"
			@letterLoc.each do |letter|
				letter[1] += 3
				@matrix[letter[0]][letter[1]] = "M"
			end
		end
		show
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
		@matrix = Array.new(4) {Array.new(4,".")}

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