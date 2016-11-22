class King < Piece
  include SteppingPiece

  def initialize(board, position, color)
    super(board, position, color)
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
