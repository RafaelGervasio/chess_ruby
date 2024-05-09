require_relative '../piece'

class Bishop < Piece
    WHITE_BISHOP_UNICODE = "\u2657"
    BLACK_BISHOP_UNICODE = "\u265D"
  
    def initialize(color, current_square)
        if color == 'white'
            super(color, 'bishop', current_square, WHITE_BISHOP_UNICODE)
        else
            super(color, 'bishop', current_square, BLACK_BISHOP_UNICODE)
        end
    end


	def valid_movement_pattern?(starting_square, ending_square)
		if starting_square.nil? || ending_square.nil?
			puts "valid_movement_pattern in bishop was called with a nil square"
			return nil
		else
			change_in_row = (ending_square.row - starting_square.row).abs
			change_in_col = (ending_square.col - starting_square.col).abs

			if (change_in_row == change_in_col)
				return true
			else
				return false
			end
		end
	end


end


