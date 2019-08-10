require 'rspec'
require 'captains_mistress/board'
require 'captains_mistress/player'

describe Board do
  board = [
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      ['1','2','3','4','5','6','7']
    ]
  subject(:board1) { Board.new(board) }
    describe '#initialize' do
      it "creates an empty board" do
        expect(board).to eq(board)
      end
    end

    describe 'draw?' do
      it "returns true if no spaces are empty" do
        board_full = Board.new([["x","x","x","x"],["x","x","x","x"],["x","x","x","x"],["x","x","x","x"]])
        expect(board_full.draw?).to eq(true)
      end
      it "returns false if there are still plays to be made" do
        board_empty = Board.new([["x","x","x","x"],["x"," ","x","x"],["x","x","x","x"],["x","x","x","x"]])
        expect(board_empty.draw?).to eq(false)
      end

    end

    describe '#won?' do
      board_win = Board.new([
        ["x","x","x","x"],
        ["x","x","o","x"],
        ["x","o","x","x"],
        ["x","x","x","x"]
      ])
      board_lose = Board.new([
        ["x","o","x","o"],
        ["o","x","o","o"],
        ["o","o","o","x"],
        ["x","x","o","x"]
      ])

      board_diagonal_win = Board.new([
        ["x","o","o","x"],
        ["o","x","o","o"],
        ["o","o","x","x"],
        ["o","o","o","x"]
      ])
      subject(:player) { Player.new(1,"x", board_win) }

      it "returns true if a players marks are 4 in a row horizontal" do
        
        
        expect(board_win.won(player)).to eq(true)
      end

      it 'it can read a winner diagonally' do 
        player_dia = Player.new(1,"x", board_diagonal_win)
        expect(board_diagonal_win.won(player_dia)).to eq(true)
      end
     
  

    end

    

   
end