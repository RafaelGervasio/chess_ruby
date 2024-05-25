require_relative '../piece'
require_relative '../board'

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


	def jumps_over_piece?(board, starting_square, ending_square)
		if starting_square.nil? || ending_square.nil?
			puts "valid_movement_pattern in bishop was called with a nil square"
			return nil
		elsif self.valid_movement_pattern?(starting_square, ending_square) == false
			puts "jumps over piece can't be called for bishop if the movement pattern was invalid"
			return nil
		else
			if ( (ending_square.row - starting_square.row).abs < 2 )
				return false
			else
			    row_step = (ending_square.row > starting_square.row) ? 1 : -1
    			col_step = (ending_square.col > starting_square.col) ? 1 : -1

    			in_between_row, in_between_col = starting_square.row + row_step, starting_square.col + col_step


    			until (in_between_row == ending_square.row) || (in_between_col == ending_square.col)
			    	return true unless board.get_square(in_between_row, in_between_col).current_piece.nil?
			    	
			    	in_between_row += row_step
      				in_between_col += col_step
      			end

      			return false
			end
		end
	end

end


