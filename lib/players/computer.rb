require 'pry'
module Players
    class Computer < Player
        
        def move(game)
            puts "K my turn!"

            # layout is a nested array of the board status --- the array conatins the current status of each potential win combination
            layout = Game::WIN_COMBINATIONS.map do |combo|
                [game.board.cells[combo[0]], game.board.cells[combo[1]], game.board.cells[combo[2]]]   
            end

            # danger finds the first "check" combo i.e. --- the first potential win combination that has 2 spots that the other player is already occupying --- if the computer doesn't play here then it will lose
            danger = layout.find do |combo|
                combo.count(game.not_current_player.token) == 2 && !combo.include?(game.current_player.token)
            end

            # if the computer is 'in danger' it looks through the danger array and finds the index of the spot it has to play in order to survive --- if the computer isn't 'in danger' then danger == nil and it plays a random spot
            if danger != nil
                f = Game::WIN_COMBINATIONS[layout.index(danger)].find do |spot|
                    !game.board.taken?("#{spot + 1}")
                end
                final = "#{f + 1}"
            else
                num = rand(1..9)
                until !game.board.taken?("#{num}")
                    num = rand(1..9)
                end
                final = "#{num}"
            end

            final

        end


    end
end
