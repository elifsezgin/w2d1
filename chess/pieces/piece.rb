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

  def symbol
    # "\u265C"
  end

  def to_s
    "P"
  end
end






# white = [w_king, w_queen, w_rook, w_bishop, w_knight, w_pawn]
# black = [b_king, b_queen, b_rook, b_bishop, b_knight, b_pawn]
# white.each do |white|
#   print white.force_encoding('utf-8')
# end
# black.each do |black|
#   print black.force_encoding('utf-8')
# end
