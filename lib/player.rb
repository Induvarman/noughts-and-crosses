require 'colorize'

class Player
  attr_reader :sign, :board, :wins

  def initialize(sign, color)
    @sign = sign.colorize(color)
    @wins = 0
  end

  def add_win
    @wins = @wins + 1
  end

  def position(panel)
    position = 0

    loop do
      print "Player #{sign}: "
      position = gets.chomp.to_i - 1

      break if panel.valid_move?(position)
    end
    panel.make_move(sign, position)
  end
end
