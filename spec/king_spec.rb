require_relative '../lib/board.rb'
require_relative '../lib/pieces/king.rb'

describe King do
    subject(:my_board) { Board.new }
    subject(:my_king) { described_class.new("white", my_board.get_square(3, 3)) }

    describe "#valid_movement_pattern?" do
        context "when the movement is valid" do
            it "moves 1 row forward and 1 column left" do
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(4, 2))).to eq(true)
            end

            it "moves 1 row forward and 1 column right" do
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(4, 4))).to eq(true)
            end

            it "moves 1 row backwards and 1 column left" do
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(2, 2))).to eq(true)
            end

            it "moves 1 row backwards and 1 column right" do
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(2, 4))).to eq(true)
            end

            it "moves 1 row forwards or backwards with no columns" do
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(4, 3))).to eq(true)
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(2, 3))).to eq(true)
            end

            it "moves no rows and 1 column left or right" do
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(3, 2))).to eq(true)
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(3, 4))).to eq(true)
            end
        end

        context "when the movement is invalid" do
            it "moves 2 rows with any columns" do
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(5, 3))).to eq(false)
            end

            it "moves any rows with 2 columns" do
                expect(my_king.valid_movement_pattern?(my_board.get_square(3, 3), my_board.get_square(3, 5))).to eq(false)
            end
        end
    end
end
