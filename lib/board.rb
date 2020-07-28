

class Board
  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    @cells[num.to_i - 1]
  end

  def full?
    @cells.each{|cell| return false if cell == " "}
    return true
  end

  def turn_count
    counter = 0
    @cells.each{|cell| counter += 1 unless cell == " "}
    counter
  end

  def taken?(num)
    @cells[num.to_i - 1] != " "
  end

  def valid_move?(num)
    valid_nums =*(1..9)
    valid_nums.include?(num.to_i) && !taken?(num)
  end

  def update(num, player)
    @cells[num.to_i - 1] = player.token if valid_move?(num)
  end

end
