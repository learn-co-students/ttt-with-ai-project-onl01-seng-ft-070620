module Players 
    class Human < Player
        def move(board)
            puts "Make a move! (1-9)"
            input = gets.chomp
            input
        end
    end
end