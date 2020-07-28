require 'spec_helper'

describe 'Players::Computer' do

  it 'inherits from Player' do
    expect(Players::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Players::Computer.new("X")
      board = Board.new

      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end

    it 'fills in its own setup if one exists' do
      computer = Players::Computer.new("X")
      other = Players::Computer.new("O")
      board = Board.new
      board.update("1", computer)
      board.update("5", other)
      board.update("7", computer)

      computer_move = computer.move(board)

      expect(computer_move).to eq("4")
    end

    it 'blocks an opponent\'s setup if one exists' do
      other = Players::Computer.new("X")
      computer = Players::Computer.new("O")
      board = Board.new
      board.update("5", other)
      board.update("1", computer)
      board.update("2", other)

      computer_move = computer.move(board)

      expect(computer_move).to eq("8")
    end

    it 'goes in a corner with the most win axis' do
      computer = Players::Computer.new("X")
      other = Players::Computer.new("O")
      board = Board.new
      board.update("7", computer)
      board.update("1", other)

      computer_move = computer.move(board)

      expect(computer_move).to eq("3")
    end

    it 'goes in a corner with the most win axis pt.2' do
      computer = Players::Computer.new("X")
      other = Players::Computer.new("O")
      board = Board.new
      board.update("4", computer)
      board.update("2", other)

      computer_move = computer.move(board)

      expect(computer_move).to eq("7")
    end

  end

end
