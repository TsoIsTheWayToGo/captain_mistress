require 'rspec'
require 'captains_mistress/player'

describe Player do
  board = [['','','','',''],['','','','',''],['','','','',''],['','','','',''],['','','','','']]
  subject(:player) { Player.new(1,"X", board) }
    describe '#initialize' do
      it "creates a player" do
        expect(player).not_to be_nil
      end
      it 'assigns a player a number' do
          expect(player.player_number).to eq(1)
        end

      it "Creates a play with a board" do
        expect(player.board).to eq(board)
      end

      it "assigns a number to player a player " do
        expect(player.player_number).to eq(1)
      end
    end

end