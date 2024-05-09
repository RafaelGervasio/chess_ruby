class Piece
	attr_accessor :current_square
	attr_reader :color, :piece_type, :symbol

	def initialize(color, piece_type, current_square, symbol)
		@color = color
		@piece_type = piece_type
		@current_square = current_square
		@symbol = symbol
	end


end