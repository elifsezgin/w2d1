require_relative "piece"

class Knight < Piece
  include SteppingPiece

  def initialize(board, position, color)
    super(board, position, color)
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
