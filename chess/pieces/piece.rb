class Piece
  attr_reader :board, :position, :color, :horizontal, :diagonal

  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  def moves
    # PLACEHOLDER
    # implemented in subclasses
    # should return an array of places a Piece can move to
  end

  def to_s
    "P"
  end
end
