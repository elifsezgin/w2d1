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
    black = [0, 1]
    white = [6, 7]
    rows.each_with_index do |row, idx1|
      row.each_index do |idx2|
        if black.include?(idx1)
          setup_pieces(:black, idx1, idx2)
        elsif white.include?(idx1)
          setup_pieces(:white, idx1, idx2)
        else
          rows[idx1][idx2] = NullPiece.instance
        end
      end
    end
  end

  def setup_pieces(color, idx1, idx2)
    pawn_row_idx =  (color == :black ? 1 : 6)
    rows[idx1][idx2] = Pawn.new(self, [idx1, idx2], color) if idx1 == pawn_row_idx
    unless idx1 == pawn_row_idx
      case idx2
      when 0, 7
        rows[idx1][idx2] = Rook.new(self, [idx1, idx2], color)
      when 1, 6
        rows[idx1][idx2] = Knight.new(self, [idx1, idx2], color)
      when 2, 5
        rows[idx1][idx2] = Bishop.new(self, [idx1, idx2], color)
      when 3
        rows[idx1][idx2] = Queen.new(self, [idx1, idx2], color)
      when 4
        rows[idx1][idx2] = King.new(self, [idx1, idx2], color)
      end
    end
  end


  def in_bounds(pos)
    pos.all? { |i| i.between?(0, 7) }
  end

  def in_check?(color)
    moves = []
    king_pos = nil

    rows.each do |row|
      row.each do |cell|
        next if cell.class == NullPiece
        if cell.class == King && cell.color == color
          king_pos = cell.position
        elsif cell.color != color
          moves << cell.moves
        end
      end
    end

    moves.include?(king_pos)
  end

  def checkmate?(color)
    if in_check?(color)
      king_moves = []
      rows.each do |row|
        row.each do |cell|
          if cell.class == King && cell.color == color
            king_moves << cell.moves
            return true if king_moves.empty?
          end
        end
      end
    end
    false
  end
end

# if __FILE__ == $PROGRAM_NAME
#   chessboard = Board.new
#   puts chessboard.rows
# end
