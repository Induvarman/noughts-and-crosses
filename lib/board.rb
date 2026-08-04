require 'pry-byebug'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9, '-')
  end

  def print_board
    board.each_with_index do |val, idx|
      print "#{val} "
      puts if ((idx + 1) % 3).zero?
    end
  end
end

board = Board.new
board.print_board
