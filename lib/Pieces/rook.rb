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
end
