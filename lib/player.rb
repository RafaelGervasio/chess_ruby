require_relative 'board'

class Player
	@@players_initialized = 0
	attr_reader :color


	def initialize
		@color = decide_color
		@@players_initialized += 1
	end


	def decide_color
		return 'white' if @@players_initialized.even?
		return 'black'
	end


	def get_player_input
		puts "Enter a row: "
		row = gets.chomp

		puts "Enter a column: "
		col = gets.chomp

		return get_player_input if not ( row.between(1, 8) or col.between(1, 8) )
		return get_player_input if ( Board.get_square(row, col).current_piece.nil? || Board.get_square(row, col).current_piece.color != self.color)
	end
end


# p1 = Player.new
# p2 = Player.new

# puts p1.color
# puts p2.color
