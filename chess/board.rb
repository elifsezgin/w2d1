require_relative "pieces/require_pieces"
require "singleton"
require_relative "display"

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    setup_board
  end

  def move_piece(start_pos, end_pos)
    raise "exception1" if self[start_pos].class == NullPiece
    raise "exception2" if self[end_pos].class == Piece
    # might be end_position the same color
    # cannot slide on another piece
    self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
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

  def in_bounds(pos)
    pos.all? { |i| i.between?(0, 7) }
  end

end

# if __FILE__ == $PROGRAM_NAME
#   chessboard = Board.new
#   puts chessboard.rows
# end
