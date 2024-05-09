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
end
