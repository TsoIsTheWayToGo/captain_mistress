
require 'colorize'
class Board

  attr_accessor :board

  def initialize(board=new_board)
    if board[board.length-1][0] == " "
      number_col = board[0].each_with_index.map {|el, index| (index + 1).to_s}
      board << number_col
    end
    @board = board
    
  end

  def new_board
    [
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      ['1','2','3','4','5','6','7']
    ]
  end

  def render
    puts "------------------------------------\n"
    @board.each do |row|
      puts "#{row}\n"
    end
  
  end

  
  def draw?
    !@board.flatten.include?(' ')
  end
  
  def won(player)
      @board.each_with_index do |row,index|
        row.each_with_index do |el,i|
  
          if el == player.mark 
            
            if (@board[index-1][i]==player.mark && @board[index-2][i]==player.mark && @board[index-3][i]==player.mark) || (@board[index+1][i]==player.mark && @board[index+2][i]==player.mark && @board[index+3][i]==player.mark)
              return true
  
            elsif (row[i-3]==player.mark && row[i-2]==player.mark && row[i-1]==player.mark) || (row[i+3]==player.mark && row[i+2]==player.mark && row[i+1]==player.mark)
              return true
  
            elsif (@board[index-1][i+1]==player.mark && @board[index-2][i+2]==player.mark && @board[index-3][i+3]==player.mark) || (@board[index+1][i-1]==player.mark && @board[index+2][i-2]==player.mark && @board[index+3][i-3]==player.mark)||(@board[index-1][i-1]==player.mark && @board[index-2][i-2]==player.mark && @board[index-3][i-3]==player.mark) || (@board[index+1][i+1]==player.mark && @board[index+2][i+2]==player.mark && @board[index+3][i+3]==player.mark)
              return true
            end
          end
  
        end
      end
    end

  def make_move(player,col,board)
     @board.reverse.each do |row|
      if row[col] == ' '
        row[col] = player.mark
        return
      end
    end
    board.render
    
    puts 'not an available space, please try again'.colorize(:yellow)
    player.take_turn(player)
   
  end
  def make_inf_move(player,col,board)

    if @board.first[col] != " "

      @board.unshift(Array.new(@board.last.length, ' '))
      @board.reverse.each do |row|
      
      if row[col] == ' '
        row[col] = player.mark
        return
      end
    end
    else

     @board.reverse.each do |row|
      if row[col] == ' '
        row[col] = player.mark
        return
      end
    end
  end
    board.render
    player.take_inf_turn(player)
   
  end

  
end