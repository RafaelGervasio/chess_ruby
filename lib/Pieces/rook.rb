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


    def jumps_over_piece?(board, starting_square, ending_square)
        if starting_square.nil? || ending_square.nil?
            puts "valid_movement_pattern in bishop was called with a nil square"
            return nil
        elsif self.valid_movement_pattern?(starting_square, ending_square) == false
            puts "jumps over piece can't be called for bishop if the movement pattern was invalid"
            return nil
        else
            if starting_square.row == ending_square.row
                col_step = (ending_square.col > starting_square.col) ? 1 : -1

                in_between_row, in_between_col = starting_square.row, starting_square.col + col_step

                until in_between_col == ending_square.col
                    return true unless board.get_square(in_between_row, in_between_col).current_piece.nil?
                    in_between_col += col_step
                end

                return false
            else
                row_step = (ending_square.row > starting_square.row) ? 1 : -1

                in_between_row, in_between_col = starting_square.row + row_step, starting_square.col

                until in_between_row == ending_square.row
                    return true unless board.get_square(in_between_row, in_between_col).current_piece.nil?
                    in_between_row += row_step
                end

                return false
            end
        end
    end
end
