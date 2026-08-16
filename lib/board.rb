require 'pry-byebug'

class Board # rubocop:disable Style/Documentation
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

  def make_move(current_player, position)
    @panel[position] = current_player
    print_board
  end

  def valid_move?(position)
    panel[position] == '-' || false
  end

  def check_status?(current_player)
    if win? current_player
      puts "Player #{current_player} Won!"
      true
    elsif draw?
      puts 'The Game is Tie!'
      true
    else
      false
    end
  end

  private

  def win?(current_player)
    WIN_COMBINATION.any? do |combo|
      combo.all? { |idx| panel[idx] == current_player }
    end
  end

  def draw?
    panel.none?('-')
  end
end
