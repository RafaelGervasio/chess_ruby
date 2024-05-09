require_relative '../piece'

class Knight < Piece
    WHITE_KNIGHT_UNICODE = "\u2658"
    BLACK_KNIGHT_UNICODE = "\u265E"
  
    def initialize(color, current_square)
        if color == 'white'
            super(color, 'knight', current_square, WHITE_KNIGHT_UNICODE)
        else
            super(color, 'knight', current_square, BLACK_KNIGHT_UNICODE)
        end
    end


    def valid_movement_pattern?(starting_square, ending_square)
        if starting_square.nil? || ending_square.nil?
            puts "valid_movement_pattern in knight was called with a nil square"
            return nil
        else
            moved_2_vert_1_horiz = ( ( (ending_square.row - starting_square.row).abs == 2 ) &&
                ( (ending_square.col - starting_square.col).abs == 1 ) )
            moved_1_vert_2_horiz = ( ( (ending_square.row - starting_square.row).abs == 1 ) &&
                ( (ending_square.col - starting_square.col).abs == 2 ) )

            return ( moved_1_vert_2_horiz || moved_2_vert_1_horiz)
        end
    end
end
