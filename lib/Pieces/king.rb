require_relative '../piece'

class King < Piece
    WHITE_KING_UNICODE = "\u2654"
    BLACK_KING_UNICODE = "\u265A"
  
    def initialize(color, current_square)
        if color == 'white'
            super(color, 'king', current_square, WHITE_KING_UNICODE)
        else
            super(color, 'king', current_square, BLACK_KING_UNICODE)
        end
    end


    def valid_movement_pattern?(starting_square, ending_square)
        if starting_square.nil? || ending_square.nil?
            puts "valid_movement_pattern in bishop was called with a nil square"
            return nil
        else
            change_in_row = (ending_square.row - starting_square.row).abs
            change_in_col = (ending_square.col - starting_square.col).abs
            return (change_in_row == 1 && change_in_col == 1) || (change_in_row == 1 && change_in_col == 0) || (change_in_row == 0 && change_in_col == 1)
        end
    end
end
