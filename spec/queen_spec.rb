require_relative '../lib/board'
require_relative '../lib/pieces/queen'

describe Queen do
  subject(:my_board) { Board.new }
  subject(:my_queen) { described_class.new('white', my_board.get_square(4, 4)) }

  describe '#valid_movement_pattern?' do
    context 'when square is invalid' do
      it "returns nil" do
        expect{ my_queen.valid_movement_pattern?(my_board.get_square(5, 4), my_board.get_square(8, 9)) }.to raise_error(StandardError)
      end
    end

    context 'when square is valid' do
      it "returns true for diagonal movement" do
        expect(my_queen.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(7, 7))).to eq(true)
        expect(my_queen.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(1, 7))).to eq(true)
        expect(my_queen.valid_movement_pattern?(my_board.get_square(8, 5), my_board.get_square(5, 2))).to eq(true)
      end

      it "returns true for non-diagonal movement" do
        expect(my_queen.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 7))).to eq(true)
        expect(my_queen.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 5))).to eq(true)
      end
    end

    context 'when square is valid' do
      it "returns true for vertical movement" do
        expect(my_queen.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(8, 4))).to eq(true)
        expect(my_queen.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(7, 5))).to eq(true)
        expect(my_queen.valid_movement_pattern?(my_board.get_square(8, 5), my_board.get_square(1, 5))).to eq(true)
      end

      it "returns true for horizontal movement" do
        expect(my_queen.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 7))).to eq(true)
        expect(my_queen.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(4, 5))).to eq(true)
      end

      it 'returns false for anything else' do
        expect(my_queen.valid_movement_pattern?(my_board.get_square(4, 4), my_board.get_square(3, 6))).to eq(false)
        expect(my_queen.valid_movement_pattern?(my_board.get_square(1, 2), my_board.get_square(3, 3))).to eq(false)
      end
    end
  end

  describe "#jumps_over_piece?" do
    subject(:queen_in_the_way) { described_class.new('black', my_board.get_square(1, 1)) }

    #TESTING VEETICALLY AND HORIZONTALLY

    context 'when there is a piece to jump over' do
        it "returns true for change in col" do
            my_board.get_square(7, 6).current_piece = queen_in_the_way
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(7, 4), my_board.get_square(7, 7))).to eq(true)
            my_board.get_square(7, 6).current_piece = nil
        end
        
          it "returns true for change in row" do
            my_board.get_square(5, 7).current_piece = queen_in_the_way
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 7), my_board.get_square(7, 7))).to eq(true)
            my_board.get_square(5, 7).current_piece = nil
        end 
    end

    context "when there is no piece to jump over" do
      it 'returns false for change in col' do
        expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(3, 3), my_board.get_square(3, 1))).to eq(false)
      end

      it 'returns false for change in row' do
        expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(3, 7), my_board.get_square(6, 7))).to eq(false)
      end
    end

    
    #TESTIN DIAGONALLY
    context 'when there is a piece to jump over' do
        it "returns true for positive row and positive col step" do
            my_board.get_square(5, 5).current_piece = queen_in_the_way
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(7, 7))).to eq(true)
            my_board.get_square(5, 5).current_piece = nil
        end
        
        it "returns true for positive row and negative col step" do
          my_board.get_square(6, 2).current_piece = queen_in_the_way
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(7, 1))).to eq(true)
            my_board.get_square(6, 2).current_piece = nil
        end
        
        it "returns true for negative row and positive col step" do
            my_board.get_square(3, 5).current_piece = queen_in_the_way
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(1, 7))).to eq(true)
            my_board.get_square(3, 5).current_piece = nil
        end
        
        it "returns true for negative row and negative col step" do
            my_board.get_square(2, 2).current_piece = queen_in_the_way
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(1, 1))).to eq(true)
            my_board.get_square(2, 2).current_piece = nil
        end
    end
    
    context 'when there is no piece to jump over' do
        it "returns false for positive row and positive col step" do
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(6, 6))).to eq(false)
        end
        
        it "returns false for positive row and negative col step" do
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(6, 2))).to eq(false)
        end
        
        it "returns false for negative row and positive col step" do
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(2, 6))).to eq(false)
        end
        
        it "returns false for negative row and negative col step" do
            expect(my_queen.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(2, 2))).to eq(false)
        end
    end
  end
end
