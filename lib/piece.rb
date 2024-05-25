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
		
	end


end



#implement it on each piece and have piece do the calling

#get player input
#tranlate the input into a move
#move_validator.valid_move?(starting_square.current_piece, starting_square, ending_square)
	#then the move validator will call each of the methods on Piece and return a BOOL.