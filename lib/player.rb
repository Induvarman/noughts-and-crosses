require 'colorize'
require_relative 'board'

class Player
  attr_reader :sign, :board

  def initialize(sign, color)
    @sign = sign.colorize(color)
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
