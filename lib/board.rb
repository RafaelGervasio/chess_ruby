require_relative 'square'

class Board


	attr_accessor :grid


	def initialize
		create_board
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


	public
	def display_board
		puts "   a  b  c  d  e  f  g  h"
		(1..8).each do |row|
  			print "#{9 - row} "
  			(1..8).each do |col|
    			square = self.get_square((9-row), col)
				piece = square.current_piece.nil? ? "-" : square.current_piece
    			print "[#{piece}]"
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
		# Row value is checked in get row.
		row_array = self.get_row(row)
		if col.between?(1, 8)
			return row_array[col - 1]
		else
			puts "get_square returned nil"
			return nil
		end
	end


end


# board = Board.new()
# board.display_board
