require_relative 'board'
require_relative 'player'
 
class Game
  attr_reader :board, :player_x, :player_o

  def initialize
    @board = Board.new
    @player_x = Player.new('x', :red)
    @player_o = Player.new('o', :blue)
  end

  def play_round
    loop do
      player_x.position board
      break if board.draw?

      player_o.position board
      break if board.draw?
    end
  end
end

game = Game.new

game.play_round
