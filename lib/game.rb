require_relative 'board'
require_relative 'player'
 
class Game
  attr_reader :board, :player_x, :player_o, :round_count

  def initialize
    @board = Board.new
    @player_x = Player.new('x', :red)
    @player_o = Player.new('o', :blue)
  end

  def play_game
    5.times do |round|
      puts "ROUND #{round + 1}"
      play_round
      puts "\nPlayer #{player_x.sign} Score: #{player_x.wins}"
      puts "Player #{player_o.sign} Score: #{player_o.wins}\n\n"
    end
    declare_winner
  end

  private

  def play_round
    loop do
      player_x.position board
      break if board.check_status? player_x

      player_o.position board
      break if board.check_status? player_o
    end
    board.empty_board
  end

  def declare_winner
    if player_x.wins > player_o.wins
      puts "Player #{player_x.sign} Won the Series"
    elsif player_x.wins < player_o.wins
      puts "Player #{player_o.sign} Won the series"
    else
      puts 'TIE'
    end
  end
end

