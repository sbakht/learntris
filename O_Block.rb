
class O_Block < Block

	def initialize(instance)
		super
		@blockLetter = "y"
		@letterLoc = [[0,0],[0,1],[1,0],[1,1]]
		@testMatrix = [['.','.'],['.','.']]
		@matrix = @testMatrix
	end

	def spawn
		@matrix = @instance.getMatrix
		@letterLoc.each do |letter|
			letter[1] += 4
			@matrix[letter[0]][letter[1]] = @blockLetter.upcase
		end
	end

end