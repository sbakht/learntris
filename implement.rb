require 'io/console'
require_relative "Matrix"

matrix = Matrix.new
activeBlock = nil
paused = false
gameStarted = false
play = false
play = true if ARGV[0] == "p"

if !play
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

                if cmd == "!"
                    paused = !paused if gameStarted
                    if gameStarted && paused
                        puts "Paused"
                        puts "Press start button to continue."
                    end
                    gameStarted = true if !gameStarted
                end

                if !paused
                    case cmd
                    when "q"
                        exit #exits the code
                    when "@"
                        puts "Learntris (c) 1992 Tetraminex, Inc."
                        puts "Press start button to begin."
                    when "p"
                        if activeBlock != nil
                            matrix.setCleared
                            # print matrix.getLockedBlocks if cmd.include?("I")
                            # activeBlock.lockInBlock
                            matrix.show
                        else
                            matrix.show if !input.include?("@")
                        end
                    when "P"
                        matrix.setCleared
                        # print matrix.getLockedBlocks if cmds.include?(["V","I"])
                        matrix.showWithTetramino
                        puts "Game Over" if matrix.gameOver
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
                    when "V"
                        matrix.moveToBottom
                    when "t"
                        matrix.showTest
                    when ";"
                        puts "\n"
                    end
                end
            end
        end

end
end

if play
    input = ""
    while 
        cmd = STDIN.getch
        if cmd == "!"
            paused = !paused if gameStarted
            if gameStarted && paused
                puts "Paused"
                puts "Press start button to continue."
            end
            gameStarted = true if !gameStarted
        end

            if !paused
                case cmd
                when "q"
                    exit #exits the code
                when "@"
                    puts "Learntris (c) 1992 Tetraminex, Inc."
                    puts "Press start button to begin."
                when "p"
                    if activeBlock != nil
                        matrix.setCleared
                        # print matrix.getLockedBlocks if cmd.include?("I")
                        # activeBlock.lockInBlock
                        matrix.show
                    else
                        matrix.show if !input.include?("@")
                    end
                when "P"
                    matrix.setCleared
                    # print matrix.getLockedBlocks if cmds.include?(["V","I"])
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
                when "V"
                    matrix.moveToBottom
                when "t"
                    matrix.showTest
                when ";"
                    puts "\n"
                end
            end
        
    end
end
