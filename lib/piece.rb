class Piece
	attr_accessor :current_square
	attr_reader :color, :piece_type, :symbol

	
	def initialize(color, piece_type, current_square, symbol)
		@color = color
		@piece_type = piece_type
		@current_square = current_square
		@symbol = symbol
	end


	def valid_movement_pattern?
	end


	def jumps_over_piece?
		#I'm doing this so for the pieces I haven't defined it in (king and knight since it doesn't apply) it returns false
		return false
	end

end
