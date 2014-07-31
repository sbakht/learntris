require_relative "Matrix"

matrix = Matrix.new

while 
    input = gets.chomp.split(" ") #allows commands to be separated by spaces
    input.each do |cmds|
        #allows commands to be written without spaces
        #doesn't split on 2char commands (which have a ?)
        if !cmds.include?("?")
            cmds = cmds.split("") 
        else
            cmds = [cmds] #makes it an array so it can pass in the each function
        end
        cmds.each do |cmd|
            case cmd
            when "q"
                exit #exits the code
            when "p"
                matrix.show
            when "P"
                matrix.setCleared
                matrix.showWithTetramino
            when "g"
                matrix.setFromInput
            when "c"
                matrix.setCleared
            when "?s"
                matrix.printScore
            when "?n"
                matrix.printNumCleared
            when "s"
                matrix.clearBlocks
            when "I"
                activeBlock = I_Block.new(matrix)
                matrix.setActiveBlock(activeBlock)
            when "O"
                activeBlock = O_Block.new(matrix)
                matrix.setActiveBlock(activeBlock)
            when "Z"
                activeBlock = Z_Block.new(matrix)
                matrix.setActiveBlock(activeBlock)
            when "S"
                activeBlock = S_Block.new(matrix)
                matrix.setActiveBlock(activeBlock)
            when "J"
                activeBlock = J_Block.new(matrix)
                matrix.setActiveBlock(activeBlock)
            when "L"
                activeBlock = L_Block.new(matrix)
                matrix.setActiveBlock(activeBlock)
            when "T"
                activeBlock = T_Block.new(matrix)
                matrix.setActiveBlock(activeBlock)
            when ")"
                matrix.rotate
            when "("
                matrix.rotate
                matrix.rotate
                matrix.rotate
            when "<"
                matrix.moveLeft
            when ">"
                matrix.moveRight
            when "v"
                matrix.moveDown
            when "t"
                matrix.showTest
            when ";"
                puts "\n"
            end
        end
    end

end


