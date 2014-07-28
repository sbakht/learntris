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
                matrix.setActiveTetramino("I")
            when "O"
                matrix.setActiveTetramino("O")
            when "Z"
                matrix.setActiveTetramino("Z")
            when "S"
                matrix.setActiveTetramino("S")
            when "J"
                matrix.setActiveTetramino("J")
            when "L"
                matrix.setActiveTetramino("L")
            when "T"
                matrix.setActiveTetramino("T")
            when ")"
                matrix.rotate
            when "t"
                matrix.show
            when ";"
                puts "\n"
            end
        end
    end

end


