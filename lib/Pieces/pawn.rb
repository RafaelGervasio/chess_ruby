require_relative '../piece'

class Pawn < Piece
	WHITE_PAWN_UNICODE = "\u2659"
	BLACK_PAWN_UNICODE = "\u265F"

	def initialize(color, current_square)
		if color == 'white'
			super(color, 'pawn', current_square, WHITE_PAWN_UNICODE)
		else
			super(color, 'pawn', current_square, BLACK_PAWN_UNICODE)
		end
	end


end