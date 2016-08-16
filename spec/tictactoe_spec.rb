require 'tictactoe'

describe Game do
  let(:a_game) do
    Game.new
  end

  describe '#win?' do
    context 'when p1 has X|X|X in row1' do
      it 'makes p1.victory become true' do
        a_game.row1 = ['X','|','X','|','X']
        a_game.win?(a_game.p1)
        expect(a_game.p1.victory).to eql(true)
      end
    end
  end

  describe '#win?' do
    context 'when p2 has O|O|O in row3' do
      it 'makes p2.victory become true' do
        a_game.row3 = ['O','|','O','|','O']
        a_game.win?(a_game.p2)
        expect(a_game.p2.victory).to eql(true)
      end
    end
  end

  describe 'place_xo' do
    context 'when p1 puts an X in middle (2,2) of empty grid' do
      it "makes row2 array be [' ','|','X','|',' ']" do
        a_game.place_xo(a_game.p1, 2, 2)
        expect(a_game.row2).to eql([' ','|','X','|',' '])
      end
    end
  end
end

