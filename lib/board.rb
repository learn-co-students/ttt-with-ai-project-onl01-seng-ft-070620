class Board
    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")
    end

    def cells
        @cells
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        input_to_index = input.to_i - 1
        @cells[input_to_index]
    end

    def full?
        !@cells.include?(" ")
    end

    def turn_count
        9 - @cells.count(" ")
    end

    def taken?(position)
        @cells[position.to_i - 1] != " "
    end

    def valid_move?(input)
        if input.to_i <= 9 && input.to_i >= 1
            !taken?(input)
        else
            false
        end
    end

    def update(position, player)
        @cells[position.to_i - 1] = player.token
    end
end