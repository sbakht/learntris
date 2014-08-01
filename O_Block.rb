
class O_Block < Block

	def initialize(instance)
		super
		@blockLetter = "y"
		@letterLoc = [[0,0],[0,1],[1,0],[1,1]]
		@testMatrix = [['.','.'],['.','.']]
		@matrix = @testMatrix
	end

	def initialzeSpawning
		if @firstSpawn == true
			@letterLoc.each do |letter|
				letter[1] += 4
			end
			@firstSpawn = false
		end
	end

end