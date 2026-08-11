require 'colorize'
require_relative 'board'

class Player
  attr_reader :sign, :board

  def initialize(sign, color)
    @sign = sign.colorize(color)
    @board = Board.new
  end

  def position
    position = 0

    loop do
      print "Player #{sign.colorize(color).upcase}: "
      position = gets.chomp.to_i - 1

      break if board.valid_move?(position)
    end
    board.make_move(sign, position)
  end
end

player_x = Player.new('x', :red)
player_o = Player.new('o', :blue)
board = Board.new
loop do
  player_x.position board

  break unless board.panel.include?('-')

  player_o.position board
end
