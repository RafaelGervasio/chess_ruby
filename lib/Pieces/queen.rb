require_relative '../piece'

class Queen < Piece
    WHITE_QUEEN_UNICODE = "\u2655"
    BLACK_QUEEN_UNICODE = "\u265B"
  
    def initialize(color, current_square)
        if color == 'white'
            super(color, 'queen', current_square, WHITE_QUEEN_UNICODE)
        else
            super(color, 'queen', current_square, BLACK_QUEEN_UNICODE)
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
            elsif (change_in_row == 0)  && (change_in_col != 0)
                return true
            elsif (change_in_row != 0)  && (change_in_col == 0)
                return true
            else
                return false
            end 
        end
    end
end
