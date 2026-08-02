class Board
  attr_accessor :board 

  def initialize
    @board = Array.new(3) { Array.new(3, '-') }
  end

  def print_board
    board.each do |row|
      puts row.each { |col| col }.join(" ")
    end
  end
end

board = Board.new
board.print_board
