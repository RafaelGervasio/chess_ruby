require_relative '../lib/board'
require_relative '../lib/pieces/rook'

describe Rook do
  subject(:my_board) { Board.new }
  subject(:my_rook) { described_class.new('white', my_board.get_square(4, 4)) }

  describe '#valid_movement_pattern?' do
    context 'when square is invalid' do
      it "returns nil" do
        expect(my_rook.valid_movement_pattern?(my_board.get_square(5, 4), my_board.get_square(9, 4))).to eq(nil)
      end
    end

    context 'when square is valid' do
      it "returns true for vertical movement" do
        expect(my_rook.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(8, 4))).to eq(true)
        expect(my_rook.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(7, 5))).to eq(true)
        expect(my_rook.valid_movement_pattern?(my_board.get_square(8, 5), my_board.get_square(1, 5))).to eq(true)
      end

      it "returns true for horizontal movement" do
        expect(my_rook.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 7))).to eq(true)
        expect(my_rook.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 5))).to eq(true)
      end

      it 'returns false for anything else' do
        expect(my_rook.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(3, 5))).to eq(false)
        expect(my_rook.valid_movement_pattern?(my_board.get_square(1, 2), my_board.get_square(2, 3))).to eq(false)
      end
    end
  end
end