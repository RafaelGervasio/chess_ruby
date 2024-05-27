require_relative '../lib/board'
require_relative '../lib/pieces/knight'

describe Knight do
  subject(:my_board) { Board.new }
  subject(:my_knight) { described_class.new('white', my_board.get_square(4, 4)) }

  describe '#valid_movement_pattern?' do
    context 'when square is invalid' do
      it "returns an error" do
        expect { my_knight.valid_movement_pattern?(my_board.get_square(8, 4), my_board.get_square(9, 6)) }.to raise_error(StandardError)
      end
    end

    context 'when square is valid' do
      it "returns true for 1 vertical 2 horizontal movement" do
        expect(my_knight.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(5, 6))).to eq(true)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(5, 2))).to eq(true)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(3, 6))).to eq(true)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(3, 2))).to eq(true)
      end

      it "returns true for 2 vertical 1 horizontal movement" do
        expect(my_knight.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(5, 6))).to eq(true)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(5, 4))).to eq(true)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(1, 6))).to eq(true)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(1, 4))).to eq(true)
      end

      it 'return false for anything else' do
        #bishop movement
        expect(my_knight.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(7, 7))).to eq(false)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(1, 7))).to eq(false)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(8, 5), my_board.get_square(5, 2))).to eq(false)

        #rook movement
        expect(my_knight.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(7, 5))).to eq(false)
        expect(my_knight.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 5))).to eq(false)
      end
    end
  end
end
