require_relative '../lib/board.rb'
require_relative '../lib/pieces/pawn.rb'

describe Pawn do
    subject(:my_board) { Board.new }

    describe '#valid_movement_pattern?' do
        subject(:my_white_pawn) { described_class.new("white", my_board.get_square(2, 5)) }
        subject(:my_black_pawn) { described_class.new("black", my_board.get_square(7, 5)) }
        
        context 'when moving 2 squares up is valid' do
            it "returns true for a white pawn moving 2 squares up and no cols" do
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(2, 5), my_board.get_square(4, 5))).to be(true)
            end

            it "returns true for a black pawn moving 2 squares up and no cols" do
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(7, 5), my_board.get_square(5, 5))).to be(true)
            end

            it 'returns true a white pawn moving 1 square up and no cols' do
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(2, 4), my_board.get_square(3, 4))).to be(true)
            end

            it 'returns true for a black pawn moving 1 square up when 2 is possible' do
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(7, 4), my_board.get_square(6, 4))).to be(true)
            end

            it 'returns false for a pawn moving 2 squares up and 1 to the side when 2 is possible' do
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(2, 5), my_board.get_square(4, 6))).to be(false)
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(7, 5), my_board.get_square(5, 6))).to be(false)
            end

            it 'returns false for a pawn moving 1 square up and 1 to the side when 2 is possible' do
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(2, 5), my_board.get_square(3, 6))).to be(false)
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(7, 5), my_board.get_square(6, 6))).to be(false)
            end
        end

        context 'when moving 1 square up is valid' do
            it "returns true for a white pawn moving 1 square up" do
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(4, 5))).to be(true)
            end

            it "returns true for a black pawn moving 1 square up" do
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(6, 5), my_board.get_square(5, 5))).to be(true)
            end

            it 'returns false for a white pawn moving 2 squares up' do
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(5, 5))).to be(false)
            end

            it 'returns false for a black pawn moving 2 squares up' do
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(6, 5), my_board.get_square(4, 5))).to be(false)
            end

            it 'returns false for a white pawn moving 1 square up and 1 to the side' do
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(3, 5), my_board.get_square(4, 6))).to be(false)
            end

            it 'returns false for a black pawn moving 1 square up and 1 to the side' do
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(6, 5), my_board.get_square(5, 6))).to be(false)
            end
        end

        before do
            my_board.get_square(3, 5).current_piece = described_class.new("black", my_board.get_square(3, 5))
            my_board.get_square(6, 5).current_piece = described_class.new("white", my_board.get_square(6, 5))
        end

        context 'when taking is possible' do
            it "returns false for a white pawn moving 1 square up" do
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(2, 5), my_board.get_square(3, 5))).to be(false)
            end

            it "returns false for a black pawn moving 1 square up" do
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(7, 5), my_board.get_square(6, 5))).to be(false)
            end

            it 'returns false for a white pawn moving 2 squares up' do
                my_board.get_square(4, 5).current_piece = described_class.new("black", my_board.get_square(4, 5))
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(2, 5), my_board.get_square(4, 5))).to be(false)
            end

            it 'returns false for a black pawn moving 2 squares up' do
                my_board.get_square(5, 5).current_piece = described_class.new("white", my_board.get_square(5, 5))
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(7, 5), my_board.get_square(5, 5))).to be(false)
            end

            it 'returns true for a white pawn moving 1 square up and 1 to the right' do
                my_board.get_square(3, 6).current_piece = described_class.new("black", my_board.get_square(3, 6))
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(2, 5), my_board.get_square(3, 6))).to be(true)
            end

            it 'returns true for a white pawn moving 1 square up and 1 to the left' do
                my_board.get_square(3, 4).current_piece = described_class.new("black", my_board.get_square(3, 4))
                expect(my_white_pawn.valid_movement_pattern?(my_board.get_square(2, 5), my_board.get_square(3, 4))).to be(true)
            end

            it 'returns true for a black pawn moving 1 square up and 1 to the right' do
                my_board.get_square(6, 6).current_piece = described_class.new("white", my_board.get_square(6, 6))
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(7, 5), my_board.get_square(6, 6))).to be(true)
            end

            it 'returns true for a black pawn moving 1 square up and 1 to the left' do
                my_board.get_square(6, 4).current_piece = described_class.new("white", my_board.get_square(6, 4))
                expect(my_black_pawn.valid_movement_pattern?(my_board.get_square(7, 5), my_board.get_square(6, 4))).to be(true)
            end
        end
    end

    describe "#jumps_over_piece?" do
        subject(:my_board) { Board.new }
        subject(:white_pawn) { described_class.new('white', my_board.get_square(2, 7)) }
        subject(:black_pawn) { described_class.new('black', my_board.get_square(7, 3)) }
        
        subject(:pawn_in_the_way_of_white) { described_class.new('white', my_board.get_square(3, 7)) }
        subject(:pawn_in_the_way_of_black) { described_class.new('white', my_board.get_square(6, 3)) }

        context "when a WHITE pawn moves 2 rows up and there IS a piece in between" do
            it "returns true" do
                my_board.get_square(3, 7).current_piece = pawn_in_the_way_of_white
                expect(white_pawn.jumps_over_piece?(my_board, my_board.get_square(2, 7), my_board.get_square(4, 7))).to be(true)
                my_board.get_square(3, 7).current_piece = nil
            end
        end

        context "when a BLACK pawn moves 2 rows up and there IS a piece in between" do
            it "returns true" do
                my_board.get_square(6, 3).current_piece = pawn_in_the_way_of_black
                expect(black_pawn.jumps_over_piece?(my_board, my_board.get_square(7, 3), my_board.get_square(5, 3))).to be(true)
                my_board.get_square(6, 3).current_piece = nil
            end
        end

        context "when a WHITE pawn moves 2 rows up and there NOT a piece in between" do
            it "returns false" do
                expect(white_pawn.jumps_over_piece?(my_board, my_board.get_square(2, 1), my_board.get_square(4, 1))).to be(false)
            end
        end

        context "when a BLACK pawn moves 2 rows up and there is NOT a piece in between" do
            it "returns false" do
                expect(black_pawn.jumps_over_piece?(my_board, my_board.get_square(7, 1), my_board.get_square(5, 1))).to be(false)
            end
        end

        context "when pawn doesn't move 2 rows up" do
            it "returns false" do
                expect(white_pawn.jumps_over_piece?(my_board, my_board.get_square(2, 1), my_board.get_square(3, 1))).to be(false)
            end
        end
    end
end
