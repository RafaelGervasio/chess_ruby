class Piece
	attr_accessor :current_square
	attr_reader :color, :piece_type, :symbol

	
	def initialize(color, piece_type, current_square, symbol)
		@color = color
		@piece_type = piece_type
		@current_square = current_square
		@symbol = symbol
	end


	def valid_movement_pattern?(starting_square, ending_square)
	end


	def jumps_over_piece?(board, starting_square, ending_square)
		#I'm doing this so for the pieces I haven't defined it in (king and knight since it doesn't apply) it returns false
		return false
	end


	def lands_on_friendly_piece?(ending_square)
		raise StandardError, "ending_square can't be nil" if ending_square.nil?
		
		return false if ending_square.current_piece.nil?
		return self.color == ending_square.current_piece.color
	end

end
