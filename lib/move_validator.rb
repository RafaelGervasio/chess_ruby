class MoveValidator

	def initialize

	end

	def jumps_over_piece?
	end

	def valid_move?(board, starting_square, ending_square)
		#VERY DEEP MODULE!
		#Avoid conditionals by using inehritiance

		piece_to_move = starting_square.current_piece
		
		return (piece_to_move.valid_movement_pattern?(starting_square, ending_square)) && 
			(not piece_to_move.jumps_over_piece?(board, starting_square, ending_square)) &&			

	end


end