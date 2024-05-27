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


    def valid_movement_pattern?(starting_square, ending_square)
        if starting_square.nil? || ending_square.nil?
            puts "valid_movement_pattern in bishop was called with a nil square"
            return nil
        else
            change_in_row = (ending_square.row - starting_square.row).abs
            change_in_col = (ending_square.col - starting_square.col).abs

            if (change_in_row == change_in_col)
                return true
            elsif (change_in_row == 0)  && (change_in_col != 0)
                return true
            elsif (change_in_row != 0)  && (change_in_col == 0)
                return true
            else
                return false
            end 
        end
    end


    def jumps_over_piece?(board, starting_square, ending_square)
        if starting_square.nil? || ending_square.nil?
            puts "valid_movement_pattern in queen was called with a nil square"
            return nil
        elsif self.valid_movement_pattern?(starting_square, ending_square) == false
            puts "jumps over piece can't be called for queen if the movement pattern was invalid"
            return nil
        else
            change_in_row = (ending_square.row - starting_square.row).abs
            change_in_col = (ending_square.col - starting_square.col).abs

            moved_diagonally = (change_in_row == change_in_col)

            if moved_diagonally
                def jumps_over_piece_diagonally?(board, starting_square, ending_square)
                    if starting_square.nil? || ending_square.nil?
                        puts "valid_movement_pattern in bishop was called with a nil square"
                        return nil
                    elsif self.valid_movement_pattern?(starting_square, ending_square) == false
                        puts "jumps over piece can't be called for bishop if the movement pattern was invalid"
                        return nil
                    else
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

end
