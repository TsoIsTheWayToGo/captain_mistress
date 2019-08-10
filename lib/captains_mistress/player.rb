require_relative 'board'
require 'byebug'

class Player
  attr_accessor :player_number,:mark ,:board

  def initialize(player_number, mark, board)
      @player_number, @mark, @board = player_number, mark, board
     
  end

  def take_turn(player)

    print "\n"
    puts "Player #{player.player_number}, Please choose a column to place your mark(#{player.mark}):"
    
    col = STDIN.gets.chomp.to_i
    possible_numbers = @board.board.last.map {|el| el.to_i}
    
    if possible_numbers.include?(col)
      col -= 1
      @board.make_move(player,col, @board)
    else
    puts "Invalid column choice, please choose a column number between 1-#{@board.board.last.length}"
    take_turn(player)
    end
    
  end

  def take_inf_turn(player)
    print "\n"
    puts "Player #{player.player_number}, Please choose a column to place your mark(#{player.mark}):"
    col = STDIN.gets.chomp.to_i
    possible_numbers = @board.board.last.map {|el| el.to_i}

    if possible_numbers.include?(col)
      col -= 1
      @board.make_inf_move(player,col, @board)
    else
    puts "Invalid column choice, please choose a column number between 1-#{@board.board.last.length}"
    take_inf_turn(player)
    end
  end

end
