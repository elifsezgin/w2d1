require_relative "piece"
require_relative "SteppingPiece"

class King < Piece
  include SteppingPiece

  def initialize(board, position, color)
    super(board, position, color)
  end

  def symbol
    color == :white ? "\u2654" : "\u265A"
  end

  def directions
    [
      [-1, 0],
      [-1, 1],
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1],
      [0, -1],
      [-1, -1]
    ]
  end

end
