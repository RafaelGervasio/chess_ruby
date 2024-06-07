require_relative '../piece'

class Queen < Piece
    WHITE_QUEEN_UNICODE = "\u2655"
    BLACK_QUEEN_UNICODE = "\u265B"

  
    def initialize(color, current_square)
        super(color, 'queen', current_square, color == 'white'? WHITE_QUEEN_UNICODE : BLACK_QUEEN_UNICODE)
    end


    def valid_movement_pattern?(starting_square, ending_square)
        raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
        raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?

        change_in_row = (ending_square.row - starting_square.row).abs
        change_in_col = (ending_square.col - starting_square.col).abs

        return true if (change_in_row == change_in_col)
        return true if (change_in_row == 0)  && (change_in_col != 0)
        return true if (change_in_row != 0)  && (change_in_col == 0)
        return false
    end


    def jumps_over_piece?(board, starting_square, ending_square)
        raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
        raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?
        raise StandardError, "Jumps over piece can't be called for queen if the movement pattern was invalid" if self.valid_movement_pattern?(starting_square, ending_square) == false

        change_in_row = (ending_square.row - starting_square.row).abs
        change_in_col = (ending_square.col - starting_square.col).abs

        moved_diagonally = (change_in_row == change_in_col)

        if moved_diagonally
            def jumps_over_piece_diagonally?(board, starting_square, ending_square)
                if ( (ending_square.row - starting_square.row).abs < 2 )
                    return false
                else
                    row_step = (ending_square.row > starting_square.row) ? 1 : -1
                    col_step = (ending_square.col > starting_square.col) ? 1 : -1

                    in_between_row, in_between_col = starting_square.row + row_step, starting_square.col + col_step


                    until (in_between_row == ending_square.row) || (in_between_col == ending_square.col)
                        return true unless board.get_square(in_between_row, in_between_col).current_piece.nil?
                        
                        in_between_row += row_step
                        in_between_col += col_step
                    end

                    return false
                end
            end

            return jumps_over_piece_diagonally?(board, starting_square, ending_square)
        else
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
            end
        end
    end

end
