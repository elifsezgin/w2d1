require_relative "piece"
require_relative "SlidingPiece"

class Queen < Piece

  include SlidingPiece

  def initialize(board, position, color)
    super(board, position, color)
    @horizontal = true
    @diagonal = true
  end

  def symbol
    color == :white ? "\u2655" : "\u265B"
  end

  protected

  def valid_moves
    all_moves = moves(@position, @horizontal, @diagonal)
    all_moves.reject! { |pos| board[pos].class == Piece }
    all_moves
  end

end
