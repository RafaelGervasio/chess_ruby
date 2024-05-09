# board_spec.rb

require_relative '../lib/board'  # Assuming your Board class is in board.rb
require_relative '../lib/square'

describe Board do
    subject(:my_board) { described_class.new }

    describe '#create_board' do
        it "creates the game board and assigns it to @grid" do
            my_board.create_board  # Manually call create_board to populate @grid
            expect(my_board.grid).not_to be_nil  # Ensure grid is not nil
        end

        it "creates a board of correct dimensions (8x8)" do
            expect(my_board.grid.length).to eq(8)  # Check rows
            my_board.grid.each do |row|
                expect(row.length).to eq(8)  # Check columns for each row
            end
        end

        it "initializes the board with Square objects" do
            my_board.grid.each do |row|
                row.each do |square|
                    expect(square).to be_an_instance_of(Square)  # Each element should be a Square
                end
            end
        end

        it "assings row and col values well to each square" do
          # Check specific squares for their row and col values
          expect(my_board.grid[0][4]).to be_an_instance_of(Square)
          expect(my_board.grid[0][4].row).to eq(8)  # Row should be 8
          expect(my_board.grid[0][4].col).to eq(5)  # Column should be 5

          expect(my_board.grid[5][0]).to be_an_instance_of(Square)
          expect(my_board.grid[5][0].row).to eq(3)  # Row should be 3
          expect(my_board.grid[5][0].col).to eq(1)  # Column should be 1
        end
    end

    describe '#get_row' do
        it "returns the correct row of squares" do

          row_index = 7
          row_squares = my_board.get_row(row_index)

          expect(row_squares.length).to eq(8)

          row_squares.each do |square|
            expect(square).to be_an_instance_of(Square)
          end

          expected_row_values = [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7], [7, 8]
          row_squares.each_with_index do |square, idx|
            expect([square.row, square.col]).to eq(expected_row_values[idx])
          end
        end
  end

  describe '#get_col' do
    it "returns the correct column of squares" do
      col_index = 4
      col_squares = my_board.get_col(col_index)

      # Assert that the col_squares array has the correct number of squares (8 for a standard chess board)
      expect(col_squares.length).to eq(8)

      # Assert that each element in the col_squares array is an instance of Square
      col_squares.each do |square|
        expect(square).to be_an_instance_of(Square)
      end

      expected_col_values = [1, 4], [2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [7, 4], [8, 4]
      col_squares.each_with_index do |square, idx|
        expect([square.row, square.col]).to eq(expected_col_values[idx])
      end
    end
  end

  describe '#get_square' do
    it "returns the correct square" do
        square = my_board.get_square(4, 7)
        expect([square.row, square.col]).to eq([4, 7])
    end

    it "returns the correct square" do
        square = my_board.get_square(1, 8)
        expect([square.row, square.col]).to eq([1, 8])
    end
  end

  describe '#update_board' do
    it "updates the board with the correct value when valid inputs are given" do
        square = my_board.get_square(3, 6)

        my_board.update_board(square, "update_value!!!")    
        expect(square.current_piece).to eq("update_value!!!")
    end
  end

  describe '#fill_board' do
    subject(:filled_board) { described_class.new }
    
    it "fill the prooper pieces on the board" do
        #write me the code to check that the board is preoperly filled
    end
  end


end
