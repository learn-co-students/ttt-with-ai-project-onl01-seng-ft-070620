class Board

    attr_accessor
    attr_reader :cells

    def initialize
        self.reset!
    end #initialize

    def display_board
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def reset!
        self.cells = Array.new(9, ' ')
    end 

end #Board