require_relative "Matrix"

matrix = Matrix.new

while 
    cmds = gets.chomp.split(" ")
    # puts cmds
    cmds.each do |cmd|
        # puts cmd
        case cmd
        when "q"
            exit #exits the code
        when "p"
            matrix.show
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
            matrix.printActiveTetramino
        when ";"
            puts "\n"
        end
    end

end


