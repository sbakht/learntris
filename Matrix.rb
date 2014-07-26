class Matrix
	@matrix = ""
	@score = 0
	@numCleared = 0

	def initialize
		@matrix = @matrix = ". . . . . . . . . .\n" * 22
		@score = 0
		@numCleared = 0
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

end