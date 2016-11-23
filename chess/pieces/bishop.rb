require_relative "piece"
require_relative "SlidingPiece"
require "colorize"

class Bishop < Piece
  include SlidingPiece

  def initialize(board, position, color)
    super(board, position, color)
    @horizontal = false
    @diagonal = true
  end

  def symbol
    color == :white ? "\u2657" : "\u265D"
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
