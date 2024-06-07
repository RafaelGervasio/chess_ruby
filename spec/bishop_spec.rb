require_relative '../lib/board'
require_relative '../lib/pieces/bishop'

describe Bishop do
  subject(:my_board) { Board.new }
  subject(:my_bishop) { described_class.new('white', my_board.get_square(4, 4)) }

  describe '#valid_movement_pattern?' do
    context 'when square is invalid' do
      it "raises an error" do
        expect { my_bishop.valid_movement_pattern?(my_board.get_square(5, 4), my_board.get_square(8, 9)) }.to raise_error(StandardError)
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

  describe '#jumps_over_piece?' do
    subject(:bishop_in_the_way) { described_class.new('black', my_board.get_square(5, 5)) }

    context "when non valid pattern is called" do
        it "raises an error" do
            expect { my_bishop.jumps_over_piece?(my_board, my_board.get_square(3, 3), my_board.get_square(5, 6)) }.to raise_error(StandardError)
        end
    end

    context 'when there is a piece to jump over' do
        it "returns true for positive row and positive col step" do
            my_board.get_square(5, 5).current_piece = bishop_in_the_way
            expect(my_bishop.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(7, 7))).to eq(true)
            my_board.get_square(5, 5).current_piece = nil
        end
        
        it "returns true for positive row and negative col step" do
          my_board.get_square(6, 2).current_piece = bishop_in_the_way
            expect(my_bishop.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(7, 1))).to eq(true)
            my_board.get_square(6, 2).current_piece = nil
        end
        
        it "returns true for negative row and positive col step" do
            my_board.get_square(3, 5).current_piece = bishop_in_the_way
            expect(my_bishop.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(1, 7))).to eq(true)
            my_board.get_square(3, 5).current_piece = nil
        end
        
        it "returns true for negative row and negative col step" do
            my_board.get_square(2, 2).current_piece = bishop_in_the_way
            expect(my_bishop.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(1, 1))).to eq(true)
            my_board.get_square(2, 2).current_piece = nil
        end
    end
    
    context 'when there is no piece to jump over' do
        it "returns false for positive row and positive col step" do
            expect(my_bishop.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(6, 6))).to eq(false)
        end
        
        it "returns false for positive row and negative col step" do
            expect(my_bishop.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(6, 2))).to eq(false)
        end
        
        it "returns false for negative row and positive col step" do
            expect(my_bishop.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(2, 6))).to eq(false)
        end
        
        it "returns false for negative row and negative col step" do
            expect(my_bishop.jumps_over_piece?(my_board, my_board.get_square(4, 4), my_board.get_square(2, 2))).to eq(false)
        end
    end
  end

  describe "lands_on_friendly_piece?" do
    subject(:same_color_bishop_on_landing_square) { described_class.new('white', my_board.get_square(6, 6)) }
    subject(:opposite_color_bishop_on_landing_square) { described_class.new('black', my_board.get_square(5, 5)) }
    
    context "when ending square is invalid" do
        it "raises an error" do
            expect{ (my_bishop.lands_on_friendly_piece?(my_board.get_square(5, 9))) }.to raise_error(StandardError)
        end
    end

    context "when it DOES land on a friendly piece" do
        it "returns true" do
            my_board.get_square(6, 6).current_piece = same_color_bishop_on_landing_square
            expect(my_bishop.lands_on_friendly_piece?(my_board.get_square(6, 6))).to be(true)
            my_board.get_square(6, 6).current_piece = nil
        end
    end
    
    context "when it lands on ENEMY PIECE" do
        it "returns false" do
            my_board.get_square(5, 5).current_piece = opposite_color_bishop_on_landing_square
            expect(my_bishop.lands_on_friendly_piece?(my_board.get_square(5, 5))).to be(false)
            my_board.get_square(5, 5).current_piece = nil
        end
    end

    context "when it lands on EMPTY SQUARE" do
        it "returns false" do
            expect(my_bishop.lands_on_friendly_piece?(my_board.get_square(5, 5))).to be(false)
        end
    end
  end
end
