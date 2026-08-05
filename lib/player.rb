require 'colorize'
require_relative 'board'

class Player
  attr_accessor :board
  attr_reader :sign, :color

  def initialize(sign, color)
    @sign = sign
    @color = color
    @board = Board.new
  end

  def get_position
    print 'Enter the pos to be insert into the board: '
    position = gets.chomp.to_i
    board.board[position - 1] = sign
    board.print_board
  end
end

player = Player.new('x', :red)
player.get_position