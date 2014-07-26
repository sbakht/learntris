require_relative "Matrix"

def genEmptyMatrix
     return ". . . . . . . . . .\n" * 22
end

matrix = Matrix.new

while 
    cmd = gets.chomp

    if cmd == "q"
        break
    elsif cmd == "p"
        matrix.print
    elsif cmd == "g"
        matrix.setFromInput
    elsif cmd == "c"
        matrix.setCleared
    elsif cmd == "?s"
        matrix.printScore
    elsif cmd == "?n"
        matrix.printNumCleared
    elsif cmd == "s"
        matrix.clearBlocks
    end
end


