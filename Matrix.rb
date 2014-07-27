class Matrix
	@matrix = ""
	@score = 0
	@numCleared = 0
	@activeTetramino = ""

	def initialize
		@matrix = @matrix = ". . . . . . . . . .\n" * 22
		@score = 0
		@numCleared = 0
		@activeTetramino = ""
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

	def print
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
	end

	def printActiveTetramino
		if @activeTetramino == "I"
			puts ". . . ."
			puts "c c c c"
			puts ". . . ."
			puts ". . . ."
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