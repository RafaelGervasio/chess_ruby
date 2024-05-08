require_relative '../board'

class Bishop < Piece


	def initialize(color, current_square)
		super(color, 'Bishop', current_square)
	end


	def valid_movement_pattern?(starting_square, ending_square)
		if starting_square.nil? || ending_square.nil?
			puts "valid_movement_pattern was called with a nil square"
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