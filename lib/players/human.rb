require "./lib/player"

module Players

  class Human < Player

    def move(board)
      puts "Pick the square you want to go on!"
      puts "Squares are numbered 1-9, left to right, top to bottom!"
      puts "Just enter in the number of your desired square!"
      num = gets
      if(board.valid_move?(num))
        board.update(num, self)
      else
        num = self.move(board)
      end
      num
    end

  end
end
