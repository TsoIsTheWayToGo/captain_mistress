require 'captains_mistress'
require_relative 'board.rb'
require_relative 'player.rb'
require 'colorize'
module CaptainsMistress
  
  # The application object. Create it with options for the game, then run by
  # calling #run.
  class App
    attr_reader :verbose 

    def initialize(options = {})
      @verbose = options.fetch(:verbose, false)
      @width = options.fetch(:width, 7)
      @height = options.fetch(:height, 6)
      @board = Board.new(Array.new(@height) {Array.new(@width){' '}})
     
      @infinite = options.fetch(:infinite, false)
      @player_one = Player.new(1,'🔴',@board)
      @player_two = Player.new(2,'🔵',@board)
      @game_over = false
      
    end

    def run #play method
      turns = 1
      until @game_over == true
        
        @board.render
        
        if (turns % 2 == 0)
          turns += 1
          @infinite == true ?  @player_two.take_inf_turn(@player_two) : @player_two.take_turn(@player_two)
          check_winner(@player_two)
        else
          turns += 1
           @infinite == true ?  @player_one.take_inf_turn(@player_one) : @player_one.take_turn(@player_one)
          check_winner(@player_one) 
      end
     
    end
    
  end


  def check_winner(player)
    system('clear')
    if @board.won(player) == true
      @board.render
      @game_over = true   
      puts '\n' 
      puts "Player #{player.player_number} just won"
    end

    if @board.draw? 
      puts "The game is a draw"
      @game_over = true
    end

  end
end
end
