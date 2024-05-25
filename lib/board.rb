require_relative 'square'
require_relative 'pieces/pawn'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/rook'
require_relative 'pieces/queen'
require_relative 'pieces/king'


class Board


	attr_accessor :grid


	def initialize
		create_board
		fill_board
	end
	

	def create_board
		grid = []
		(1..8).each do |row|
			row_array = []

			(1..8).each do |col|
				row_array.append(Square.new((9-row), col, nil))
			end

			grid.append(row_array)
		end

		@grid = grid
	end


	def fill_board

		def place_piece(square_to_fill, color, piece_type)
			piece = case piece_type
	        	when 'pawn'
	        	  Pawn.new(color, square_to_fill)
	        	when 'rook'
	              Rook.new(color, square_to_fill)
	            when 'knight'
	              Knight.new(color, square_to_fill)
	            when 'bishop'
	              Bishop.new(color, square_to_fill)
	            when 'queen'
	              Queen.new(color, square_to_fill)
	            when 'king'
	              King.new(color, square_to_fill)
	            else
	              nil
	            end
			square_to_fill.current_piece = piece
		end

		def fill_pawns
			(1..8).each do |col|
				place_piece(self.get_square(2, col), 'white', 'pawn')
				place_piece(self.get_square(7, col), 'black', 'pawn')
			end
		end

		def fill_white_pieces
		    place_piece(get_square(1, 1), 'white', 'rook')
		    place_piece(get_square(1, 2), 'white', 'knight')
		    place_piece(get_square(1, 3), 'white', 'bishop')
		    place_piece(get_square(1, 4), 'white', 'queen')
		    place_piece(get_square(1, 5), 'white', 'king')
		    place_piece(get_square(1, 6), 'white', 'bishop')
		    place_piece(get_square(1, 7), 'white', 'knight')
		    place_piece(get_square(1, 8), 'white', 'rook')
		end

		def fill_black_pieces
		    place_piece(get_square(8, 1), 'black', 'rook')
		    place_piece(get_square(8, 2), 'black', 'knight')
		    place_piece(get_square(8, 3), 'black', 'bishop')
		    place_piece(get_square(8, 4), 'black', 'queen')
		    place_piece(get_square(8, 5), 'black', 'king')
		    place_piece(get_square(8, 6), 'black', 'bishop')
		    place_piece(get_square(8, 7), 'black', 'knight')
		    place_piece(get_square(8, 8), 'black', 'rook')
		end

		fill_pawns()
		fill_white_pieces()
		fill_black_pieces()
	end


	public
	def display_board
		puts "   a  b  c  d  e  f  g  h"
		(1..8).each do |row|
  			print "#{9 - row} "
  			(1..8).each do |col|
    			square = self.get_square((9-row), col)
				piece_symbol = square.current_piece.nil? ? "-" : square.current_piece.symbol
    			print "[#{piece_symbol}]"
    		end
    		puts
		end
	end

	def get_row(row)
		if row.between?(1, 8)
			return @grid[8 - row]
		else
			puts "get_row returned nil"
			nil
		end
	end


	def get_col(col)
		if col.between?(1, 8)
			column = []
			
			(1..8).each do |row|
      			row_array = self.get_row(row)
  				column.append(row_array[col - 1])
  			end
			
			return column
		else
			puts "get_col returned nil"
			return nil
		end
	end


	def get_square(row, col)
		if ( ( col.between?(1, 8) ) && ( row.between?(1, 8) ) )
			row_array = self.get_row(row)
			return row_array[col - 1]
		else
			puts "get_square returned nil"
			return nil
		end
	end


	def update_board(square, new_piece)
		square.current_piece = new_piece
	end


end


# board = Board.new()
# board.display_board