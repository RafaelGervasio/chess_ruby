require_relative '../piece'
require_relative '../board'


class Bishop < Piece
    WHITE_BISHOP_UNICODE = "\u2657"
    BLACK_BISHOP_UNICODE = "\u265D"
  
  
    def initialize(color, current_square)
        super(color, 'bishop', current_square, color == 'white'? WHITE_BISHOP_UNICODE : BLACK_BISHOP_UNICODE)
    end


	def valid_movement_pattern?(starting_square, ending_square)
		raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
		
		change_in_row = (ending_square.row - starting_square.row).abs
		change_in_col = (ending_square.col - starting_square.col).abs
		
		return true if (change_in_row == change_in_col)
		return false
	end


	def jumps_over_piece?(board, starting_square, ending_square)
		raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
		raise StandardError, "Jumps over piece can't be called for bishop if the movement pattern was invalid" if self.valid_movement_pattern?(starting_square, ending_square) == false

		return false if ( (ending_square.row - starting_square.row).abs < 2 )
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


