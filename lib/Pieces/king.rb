require_relative '../piece'


class King < Piece
    WHITE_KING_UNICODE = "\u2654"
    BLACK_KING_UNICODE = "\u265A"

  
    def initialize(color, current_square)
        super(color, 'king', current_square, color == 'white'? WHITE_KING_UNICODE : BLACK_KING_UNICODE)
    end


    def valid_movement_pattern?(starting_square, ending_square)
        raise StandardError, "Can't have a nil square" if starting_square.nil? || ending_square.nil?
        raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?

        change_in_row = (ending_square.row - starting_square.row).abs
        change_in_col = (ending_square.col - starting_square.col).abs
        return (change_in_row == 1 && change_in_col == 1) || (change_in_row == 1 && change_in_col == 0) || (change_in_row == 0 && change_in_col == 1)
    end
end
