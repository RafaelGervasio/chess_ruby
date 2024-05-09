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
end
