require_relative '../piece'


class Bishop < Piece
    WHITE_BISHOP_UNICODE = "\u2657"
    BLACK_BISHOP_UNICODE = "\u265D"
  
  
    def initialize(color, current_square)
        super(color, 'bishop', current_square, color == 'white'? WHITE_BISHOP_UNICODE : BLACK_BISHOP_UNICODE)
    end


	def valid_movement_pattern?(starting_square, ending_square)
		raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
		raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?
		
		change_in_row = (ending_square.row - starting_square.row).abs
		change_in_col = (ending_square.col - starting_square.col).abs
		
		return true if (change_in_row == change_in_col)
		return false
	end


	# def jumps_over_piece?(board, starting_square, ending_square)
	# 	def handle_errors(starting_square, ending_square)
	# 		raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
	# 		raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?
	# 		raise StandardError, "Jumps over piece can't be called for bishop if the movement pattern was invalid" if self.valid_movement_pattern?(starting_square, ending_square) == false
	# 	end

	#     def map(array, apply)
	# 		new_array = []
	# 		for item in array
	# 			new_array.append(apply.call(item))
	# 		end
	# 		return new_array
	# 	end

	# 	def filter(array, condition)
	# 		new_array = []
	# 		for item in array
	# 			if condition.call(item)
	# 				new_array.append(item)
	# 			end
	# 		end
	# 		return new_array
	# 	end

	# 	def reduce(array, init, accumulater)
	# 		accumulated = init
	# 		for item in array
	# 			accumulated = accumulater.call(accumulated, item)
	# 		end
	# 		return accumulated
	# 	end

	# 	def merge_arrays(arr1, arr2)
	# 		new_arr = []
	# 		for i in 0...arr1.length
	# 			new_arr.append([arr1[i], arr2[i]])
	# 		end
	# 		new_arr
	# 	end

	# 	squares_from_indexes = Proc.new do |indexes|
	# 		board.get_square(indexes[0], indexes[1])
	# 	end

	# 	no_piece_in_square = Proc.new do |square|
	# 		square.current_piece.nil?
	# 	end

	# 	handle_errors(starting_square, ending_square)

	# 	row_path_indexes = range(starting_square.row, ending_square.row)
	# 	col_path_indexes = range(starting_square.col, ending_square.col)

	# 	merged_arr_of_indexes = merge_arrays(row_path_indexes, col_path_indexes)
	# 	array_of_squares = map(merged_arr, squares_from_indexes)

	# 	array_of_bools = filter(array_of_squares, no_piece_in_square)

	# 	return array_of_bools.any? { |item| item == false}
	# end

	def jumps_over_piece?(board, starting_square, ending_square)
		def handle_errors(starting_square, ending_square)
			raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
			raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?
			raise StandardError, "Jumps over piece can't be called for bishop if the movement pattern was invalid" if self.valid_movement_pattern?(starting_square, ending_square) == false
		end

		handle_errors(starting_square, ending_square)
	
		return false if ( (ending_square.row - starting_square.row).abs < 2 )

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


