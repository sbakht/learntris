require_relative "Matrix"

matrix = Matrix.new

while 
    cmd = gets.chomp

    case cmd
    when "q"
        break
    when "p"
        matrix.print
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
    when "t"
        matrix.printActiveTetramino
    end

end


