require_relative '../piece'


class Pawn < Piece
	WHITE_PAWN_UNICODE = "\u2659"
	BLACK_PAWN_UNICODE = "\u265F"


	def initialize(color, current_square)
		super(color, 'pawn', current_square, color == 'white'? WHITE_PAWN_UNICODE : BLACK_PAWN_UNICODE)
	end


	def valid_movement_pattern?(starting_square, ending_square)
		raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
	    
	    change_in_row = (ending_square.row - starting_square.row).abs
	    change_in_col = (ending_square.col - starting_square.col).abs
	    
	    # Movement that's NOT capturing.
	    if ending_square.current_piece.nil?
            initial_rank_pawns = (starting_square.row == 2) || (starting_square.row == 7)
            moves_2_rows_up = (change_in_row == 2 && change_in_col == 0)
            moves_1_row_up = (change_in_row == 1 && change_in_col == 0)

            return (moves_2_rows_up || moves_1_row_up) if initial_rank_pawns
            return moves_1_row_up

	    # Movement that IS capturing
	    else
            return change_in_row == 1 && change_in_col.abs == 1 && (not ending_square.current_piece.nil?)
	    end
	end


	def jumps_over_piece?(board, starting_square, ending_square)
    	raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
    	raise StandardError, "Jumps over piece can't be called for pawn if the movement pattern was invalid" if self.valid_movement_pattern?(starting_square, ending_square) == false

	    change_in_row = (ending_square.row - starting_square.row).abs

	    return false if change_in_row < 2
		if self.color == 'white'
    		obstructing_piece_in_3rd_row =  !(board.get_square(starting_square.row + 1, starting_square.col).current_piece.nil?)
    		return obstructing_piece_in_3rd_row
		else
			obstructing_piece_in_6th_row =  !(board.get_square(starting_square.row - 1, starting_square.col).current_piece.nil?)
			return obstructing_piece_in_6th_row
		end
	end

end