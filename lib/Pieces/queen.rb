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
end
