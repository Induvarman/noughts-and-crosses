require 'colorize'
require_relative 'board'

class Player
  attr_reader :sign, :color

  def initialize(sign, color)
    @sign = sign
    @color = color
  end

  def position(board)
    position = 0

    loop do
      print "Player #{sign.colorize(color)}: "
      position = gets.chomp.to_i - 1

      break if valid_move?(board, position)
    end
    board.panel[position] = sign.colorize(color)
    board.print_board
  end

  private

  def valid_move?(board, pos)
    if board.panel[pos] == '-'
      true
    else
      puts 'RETRY!'
      false
    end
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
