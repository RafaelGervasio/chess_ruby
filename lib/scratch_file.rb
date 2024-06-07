# def sum(a, b)
#   return a + b
# end

#In ruby you have to use procs.

# sum = Proc.new { |a, b| a + b }

# def operate_on_vals(a, b, f)
#   return f.call(a, b)
# end

# puts operate_on_vals(4, 4, sum)


#First class function - accept func as arg
def for_each(array, f)
	array.each do |elem|
		puts f.call(elem)
	end
end

#First class func - returns func
def my_mult(n)
	return Proc.new { |a| a * n }
end


my_array = [1, 2, 3, 4, 5]
double = Proc.new { |n| n * 2 }
four_x = Proc.new { |n| n * 4 }



# for_each(my_array, double)
# for_each(my_array, four_x)
# for_each(my_array, my_mult(10))



# def withObjectCopy(object, modify)
# 	copy = object
# 	modify.call(copy)
# 	return copy
# end


# puts withObjectCopy(2, double)



# def tryCatch (to_try, if_error)
# 	try
# 		to_try.call
# 	catch(error)
# 		if_error.call
# 	end
# end


# tryCatch()



# def my_when(condition, action)
# 	if condition
# 		action.call
# 	end
# end

log1 = Proc.new {puts "I'm working!"}
log2 = Proc.new {puts "I'm working as well!"}

# my_when(2 == 2, my_log)
# my_when(2 == 3-1, my_log)




def IF(condition, action, else_action)
	if condition
		action.call
	else
		else_action.call
	end
end


# IF(2==2, log1, log2)
# IF(2==3, log1, log2)


#THIS IS SO FUN!



def create_multipler(n)
	return Proc.new {|a| a * n}
end

five_x = create_multipler(5)
# puts five_x.call(10)



def compose(f1, f2)
	return Proc.new {|arg| f1.call(f2.call(arg))}
end


addOne = Proc.new { |x| x + 1}
square = Proc.new { |x| x ** 2}

# puts compose(addOne, square).call(5)


def make_adder(n)
	return Proc.new {|arg| arg + n}
end

increment_by_10 = make_adder(10)
# puts increment_by_10.call(100)




def map(array, apply)
	new_array = []
	for item in array
		new_array.append(apply.call(item))
	end
	return new_array
end


# puts map([1, 2, 3, 4], double)

#So that's map. Take an array and Maps it out to a new array, according to some function


def filter(array, condition)
	new_array = []
	for item in array
		if condition.call(item)
			new_array.append(item)
		end
	end
	return new_array
end


over_five = Proc.new {|n| n > 5}

# puts filter([4, 5, 6, 2, 8], over_five)


def reduce(array, init, accumulater)
	accumulated = init
	for item in array
		accumulated = accumulater.call(accumulated, item)
	end
	return accumulated
end

sum = Proc.new {|a, b| a + " " + b}


# puts reduce(['hey', "hello", "I'm", "Rafa", "(:"], "", sum)




def reduce(array, init, accumulater)
	accumulated = init
	for item in array
		accumulated = accumulater.call(accumulated, item)
	end
	return accumulated
end


keep_largest = Proc.new {|a, b| a > b ? a : b}

puts reduce([1, 2, 3, 7, 4, 10, 115, 5, 2], 0, keep_largest)






#error checking

#return false if thers' 1 square diff - can't jump then

#create an array of squares path
	#range function - from starting_square.row to es.row
		#same for column

#map those indicies to an array of squares

#filter seeing if any pair of squares has a piece

#return true if array not empty


def range(start_index, end_index)
	arr = []
	for i in (start_index + 1)...(end_index)
		arr.append(i)
	end
	arr
end


# puts range(1, 9)


def map(array, apply)
	new_array = []
	for item in array
		new_array.append(apply.call(item))
	end
	return new_array
end




def merge_arrays(arr1, arr2)
	new_arr = []
	for i in 0...arr1.length
		new_arr.append([arr1[i], arr2[i]])
	end
	new_arr
end


# test_arr1 = [1, 2, 3]
# test_arr2 = [4, 5, 6]

# p merge_arrays(test_arr1, test_arr2)

# p map(test_arr, merge_arrays)







squares_from_indexes = Proc.new do |indexes|
	board.get_square(indexes[0], indexes[1])
end


piece_in_square = Proc.new do |square|
	square.current_piece.nil?
end


def jumps_over_piece?(board, starting_square, ending_square)
	def handle_errors(starting_square, ending_square)
		raise StandardError, "Can't have nil squares" if starting_square.nil? || ending_square.nil?
		raise StandardError, "A piece must be in starting square" if starting_square.current_piece.nil?
		raise StandardError, "Jumps over piece can't be called for bishop if the movement pattern was invalid" if self.valid_movement_pattern?(starting_square, ending_square) == false
	end

	handle_errors(starting_square, ending_square)

	row_path_indexes = range(starting_square.row, ending_square.row)
	col_path_indexes = range(starting_square.col, ending_square.col)

	merged_arr_of_indexes = merge_arrays(row_path_indexes, col_path_indexes)
	array_of_squares = map(merged_arr, squares_from_indexes)

	array_of_bools = filter(array_of_squares, piece_in_square)

	return array_of_bools.any? { |item| item == false}
end



# def jumps_over_piece?(board, starting_square, ending_square)

# 	handle_errors(starting_square, ending_square)

# 	return false if ( (ending_square.row - starting_square.row).abs < 2 )

#   	row_step = (ending_square.row > starting_square.row) ? 1 : -1
# 	col_step = (ending_square.col > starting_square.col) ? 1 : -1

# 	in_between_row, in_between_col = starting_square.row + row_step, starting_square.col + col_step

# 	until (in_between_row == ending_square.row) || (in_between_col == ending_square.col)
# 		return true unless board.get_square(in_between_row, in_between_col).current_piece.nil?	
		
# 		in_between_row += row_step
# 		in_between_col += col_step
# 	end

# 	return false
# end