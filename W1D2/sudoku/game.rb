require_relative './board.rb'
require_relative './tile.rb'

class Game

  attr_reader :board
  def initialize(board)
    @board = board
  end

  def play
    until @board.solved?
      @board.render
      puts "which position?"
      position = gets.chomp.split(",").map { |el| el.to_i }
      puts "which value?"
      value = gets.chomp

      @board[pos] = Tile.new(value, true)
      @board.render
    end

    puts "You win!"
  end

end
board = Board.new("sudoku1-almost.txt")
game = Game.new(board)
game.play
