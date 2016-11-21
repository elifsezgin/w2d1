require_relative "piece"
require "singleton"
require_relative "nullpiece"
require "byebug"

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    setup_board
  end

  def move_piece(start_pos, end_pos)
  end

  def setup_board
    a = [0, 1, 6, 7]
    rows.each_with_index do |row, idx|
      row.each_index do |idx2|
        if a.include?(idx)
          rows[idx][idx2] = Piece.new
        else
          rows[idx][idx2] = NullPiece.instance
        end
      end
    end
  end
end

# if __FILE__ == $PROGRAM_NAME
#   chessboard = Board.new
#   puts chessboard.rows
# end
