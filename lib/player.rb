require 'colorize'
require_relative 'board'

class Player
  attr_reader :sign, :color

  def initialize(sign, color)
    @sign = sign
    @color = color
  end

  def position(board)
    print "Player #{sign.colorize(color)}: "
    position = gets.chomp.to_i
    board.board[position - 1] = sign.colorize(color)
    board.print_board
  end
end

player_x = Player.new('x', :red)
player_o = Player.new('o', :blue)
board = Board.new
loop do
  player_x.position board

  break unless board.board.include?('-')

  player_o.position board
end
