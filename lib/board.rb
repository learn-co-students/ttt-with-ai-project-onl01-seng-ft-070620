class Board

    attr_accessor :cells

    def initialize
        self.reset!
    end #initialize

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def reset!
        self.cells = Array.new(9, ' ')
    end 

    def input_to_index(input)
        input.to_i - 1
    end # input_to_index

    def position(input)
        self.cells[self.input_to_index(input)]
    end #position

    def full?
        !self.cells.any? {|cell| cell == "" || cell == " "}
    end # full?

    def turn_count
        self.cells.count('X') + self.cells.count('O')
    end # turn_count

    def taken?(input)
        self.position(input) == '' || self.position(input) == ' ' ? false : true
    end # taken?

    def valid_move?(input)
        # binding.pry
        !self.taken?(input) && input.to_i.between?(1,9)
    end # valid_move?

    def update(input, player)
        binding.pry
        self.cells[self.input_to_index(input)] = player.token
    end # update

end #Board