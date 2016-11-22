require_relative "piece"

class Rook < Piece

  include SlidingPiece

  def initialize(board, position, color)
    super(board, position, color)
    @horizontal = true
    @diagonal = false
  end

  def valid_moves
    all_moves = moves(@position, @horizontal, @diagonal)
    all_moves.reject! { |pos| board[pos].class == Piece }
    all_moves
  end
end
