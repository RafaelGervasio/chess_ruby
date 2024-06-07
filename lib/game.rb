require_relative 'move_validator'

class GameState
	def initialize

	end


	def in_check?(board, color)
		opponent_color = color == 'white'? 'black' : 'white'
		board.each_piece(color) do |piece|
			if piece.piece_type	== 'king'
				king_of_color = piece
			end
		end

		
		board.each_piece(opponent_color) do |piece|
			return true if MoveValidator.valid_move?(board, piece.current_square, king_of_color.current_square)
		end
	end
end