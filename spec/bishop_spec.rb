require_relative '../lib/board'
require_relative '../lib/pieces/bishop'

describe Bishop do
  subject(:my_board) { Board.new }
  subject(:my_bishop) { described_class.new('white', my_board.get_square(4, 4)) }

  describe '#valid_movement_pattern?' do
    context 'when square is invalid' do
      it "returns nil" do
        expect(my_bishop.valid_movement_pattern?(my_board.get_square(5, 4), my_board.get_square(8, 9))).to eq(nil)
      end
    end

    context 'when square is valid' do
      it "returns true for diagonal movement" do
        expect(my_bishop.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(7, 7))).to eq(true)
        expect(my_bishop.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(1, 7))).to eq(true)
        expect(my_bishop.valid_movement_pattern?(my_board.get_square(8, 5), my_board.get_square(5, 2))).to eq(true)
      end

      it "returns false for non-diagonal movement" do
        expect(my_bishop.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 7))).to eq(false)
        expect(my_bishop.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 5))).to eq(false)
      end
    end
  end
end
