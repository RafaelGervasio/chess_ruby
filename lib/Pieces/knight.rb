require_relative '../piece'


class Knight < Piece
    WHITE_KNIGHT_UNICODE = "\u2658"
    BLACK_KNIGHT_UNICODE = "\u265E"
  
  
    def initialize(color, current_square)
        super(color, 'knight', current_square, color == 'white'? WHITE_KNIGHT_UNICODE : BLACK_KNIGHT_UNICODE)
    end


    def valid_movement_pattern?(starting_square, ending_square)
        raise StandardError, "can't have nil squares" if starting_square.nil? || ending_square.nil?
        
        moves_2_rows_1_col = ( ( (ending_square.row - starting_square.row).abs == 2) && 
            (ending_square.col - starting_square.col).abs == 1 )
        moves_1_row_2_cols = ( ( (ending_square.row - starting_square.row).abs == 1 ) &&
            ( (ending_square.col - starting_square.col).abs == 2 ) )

        return ( moves_1_row_2_cols || moves_2_rows_1_col)
    end
end
