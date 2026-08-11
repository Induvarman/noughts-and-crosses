require 'pry-byebug'

class Board
  WIN_COMBINATION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  attr_reader :panel

  def initialize
    @panel = Array.new(9, '-')
  end

  def print_board
    panel.each_with_index do |val, idx|
      print "#{val} "
      puts if ((idx + 1) % 3).zero?
    end
  end

  def make_move(player_move, position)
    @panel[position] = player_move

    if check_status player_move
      print_board
      puts "Player #{player_move} Won!"
      true
    elsif draw?
      print_board
      puts 'DRAW!'
    end
  end

  protected

  def valid_move?(position)
    panel[position] == '-' || false
  end

  private

  def check_status(player_move)
    WIN_COMBINATION.any? do |combo|
      combo.all? { |idx| panel[idx] == player_move }
    end
  end

  def draw?
    panel.none?('-')
  end
end
