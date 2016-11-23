require_relative "piece"
require_relative "SteppingPiece"

class Knight < Piece
  include SteppingPiece

  def initialize(board, position, color)
    super(board, position, color)
  end

  def symbol
    color == :white ? "\u2658" : "\u265E"
  end

  def directions
    [
      [-2, 1],
      [-1, 2],
      [1, 2],
      [2, 1],
      [2, -1],
      [-1, -2],
      [1, -2],
      [-2, -1]
    ]
  end
end
