require_relative "piece"
require "colorize"

class Bishop < Piece
  include SlidingPiece

  def initialize(board, position, color)
    super(board, position, color)
    @horizontal = false
    @diagonal = true
  end

  def symbol
    "\u265D".colorize(color)
  end

  protected

  def valid_moves
    all_moves = moves(@position, @horizontal, @diagonal)
    all_moves.reject! do |pos|
      board[pos].superclass == Piece && board[pos].color == color
    end
    all_moves
  end

end


# w_king = "\u2654"
# w_queen = "\u2655"
# w_rook = "\u2656"
# w_bishop = "\u2657"
# w_knight = "\u2658"
# w_pawn = "\u2659"
# b_king = "\u265A"
# b_queen = "\u265B"
# b_rook = "\u265C"
# b_bishop = "\u265D"
# b_knight = "\u265E"
# b_pawn = "\u265F"
# white = [w_king, w_queen, w_rook, w_bishop, w_knight, w_pawn]
# black = [b_king, b_queen, b_rook, b_bishop, b_knight, b_pawn]
# white.each do |white|
#   print white.force_encoding('utf-8')
# end
# black.each do |black|
#   print black.force_encoding('utf-8')
# end
