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


	
	def valid_movement_pattern?(starting_square, ending_square)
		if starting_square.nil? || ending_square.nil?
			puts "valid_movement_pattern in bishop was called with a nil square"
			return nil
		else
		    change_in_row = (ending_square.row - starting_square.row).abs
		    change_in_col = (ending_square.col - starting_square.col).abs
		    
		    # Movement that's NOT capturing
		    if ending_square.current_piece.nil?
                if (starting_square.row == 2) || (starting_square.row == 7)
            		return (change_in_row == 1 && change_in_col == 0) || (change_in_row == 2 && change_in_col == 0)
	            else
	                return change_in_row == 1 && change_in_col == 0
	            end

		    #movement that IS capturing
		    else
	            return change_in_row == 1 && change_in_col.abs == 1 && (not ending_square.current_piece.nil?)
		    end
		end
	end


	def jumps_over_piece?(board, starting_square, ending_square)
    	if starting_square.nil? || ending_square.nil?
            puts "valid_movement_pattern in pawn was called with a nil square"
            return nil
        elsif self.valid_movement_pattern?(starting_square, ending_square) == false
            puts "jumps over piece can't be called for pawn if the movement pattern was invalid"
            return nil
        else
		    change_in_row = (ending_square.row - starting_square.row).abs

		    if change_in_row < 2
		    	return false
	    	else
	    		if self.color == 'white'
		    		piece_in_the_middle =  !(board.get_square(starting_square.row + 1, starting_square.col).current_piece.nil?)
		    		return piece_in_the_middle
    			else
    				piece_in_the_middle =  !(board.get_square(starting_square.row - 1, starting_square.col).current_piece.nil?)
    				return piece_in_the_middle
    			end
    		end
    	end
	end


end