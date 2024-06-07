require_relative '../piece'

class Rook < Piece
    WHITE_ROOK_UNICODE = "\u2656"
    BLACK_ROOK_UNICODE = "\u265C"
  
    def initialize(color, current_square)
        super(color, 'rook', current_square, color == 'white'? WHITE_ROOK_UNICODE : BLACK_ROOK_UNICODE)
    end


    def valid_movement_pattern?(starting_square, ending_square)
        raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
        raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?

        horizontal_movement = ( ( starting_square.row != ending_square.row ) && 
            ( starting_square.col == ending_square.col ) )
        vertical_movement = ( ( starting_square.row == ending_square.row ) && 
            ( starting_square.col != ending_square.col ) )

        return (horizontal_movement || vertical_movement)
    end


    def jumps_over_piece?(board, starting_square, ending_square)
        raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
        raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?
        raise StandardError, "Jumps over piece can't be called for rook if the movement pattern was invalid" if self.valid_movement_pattern?(starting_square, ending_square) == false

        if starting_square.row == ending_square.row
            def jumps_over_piece_horizontally?(board, starting_square, ending_square)
                col_step = (ending_square.col > starting_square.col) ? 1 : -1

                in_between_row, in_between_col = starting_square.row, starting_square.col + col_step

                until in_between_col == ending_square.col   
                    return true unless board.get_square(in_between_row, in_between_col).current_piece.nil?
                    in_between_col += col_step
                end

                return false
            end
            jumps_over_piece_horizontally?(board, starting_square, ending_square)

        else
            def jumps_over_piece_vertically?(board, starting_square, ending_square)
                row_step = (ending_square.row > starting_square.row) ? 1 : -1

                in_between_row, in_between_col = starting_square.row + row_step, starting_square.col

                until in_between_row == ending_square.row
                    return true unless board.get_square(in_between_row, in_between_col).current_piece.nil?
                    in_between_row += row_step
                end

                return false
            end
            jumps_over_piece_vertically?(board, starting_square, ending_square)
            jumps_over_piece_vertically?(board, ending_square)
        end
    end
end
