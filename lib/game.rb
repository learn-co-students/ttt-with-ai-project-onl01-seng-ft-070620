

class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    return @player_1 if @board.turn_count % 2 == 0
    return @player_2
  end

  def won?
    WIN_COMBINATIONS.each{|combo|return combo if @board.position(combo[0] + 1) == @board.position(combo[1] + 1) && @board.position(combo[2] + 1) == @board.position(combo[1] + 1) && @board.position(combo[0] + 1) != " "}
    return false
  end

  def draw?
    !self.won? && @board.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    return @board.position(self.won?[0] + 1) if self.won?
    return nil
  end

  def turn
      self.current_player.move(@board)
      puts ""
  end

  def play
    until self.over?
      self.board.display
      self.turn
    end
    self.board.display
    if self.won?
      puts "Congratulations #{self.winner}!"
      puts "You won the round!"
    else
      puts "Cat's Game!"
      puts "(That means it's a tie!)"
    end
  end

end
