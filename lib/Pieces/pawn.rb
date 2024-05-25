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
		    change_in_row = ending_square.row - starting_square.row
		    change_in_col = ending_square.col - starting_square.col
		    
		    # Movement that's NOT capturing
		    if ending_square.current_piece.nil?
		        if self.color == 'white'
	                if starting_square.row == 2
                		return (change_in_row == 1 && change_in_col == 0) || (change_in_row == 2 && change_in_col == 0)
		            else
		                return change_in_row == 1 && change_in_col == 0
		            end
		        else
		            if starting_square.row == 7
		                return (change_in_row == -1 && change_in_col == 0) || (change_in_row == -2 && change_in_col == 0)
		            else
		                return change_in_row == -1 && change_in_col == 0
		            end
		        end
		    #movement that IS capturing
		    else
		        if self.color == 'white'
		            return change_in_row == 1 && change_in_col.abs == 1 && (not ending_square.current_piece.nil?)
		        else
		            return change_in_row == -1 && change_in_col.abs == 1 && (not ending_square.current_piece.nil?)
		        end
		    end
		end
	end


end