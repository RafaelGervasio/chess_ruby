require_relative '../piece'

class Rook < Piece
    WHITE_ROOK_UNICODE = "\u2656"
    BLACK_ROOK_UNICODE = "\u265C"
  
    def initialize(color, current_square)
        if color == 'white'
            super(color, 'rook', current_square, WHITE_ROOK_UNICODE)
        else
            super(color, 'rook', current_square, BLACK_ROOK_UNICODE)
        end
    end


    def valid_movement_pattern?(starting_square, ending_square)
        if starting_square.nil? || ending_square.nil?
            puts "valid_movement_pattern in rook was called with a nil square"
            return nil
        else
            horizontal_movement = ( ( starting_square.row != ending_square.row ) && 
                ( starting_square.col == ending_square.col ) )
            vertical_movement = ( ( starting_square.row == ending_square.row ) && 
                ( starting_square.col != ending_square.col ) )

            return (horizontal_movement || vertical_movement)
        end
    end
end
