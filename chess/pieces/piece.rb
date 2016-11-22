class Piece
  attr_reader :value

  def initialize
    @value = "1"
  end

  def moves
    # implemented in subclasses
  end

  def color
  end

  def to_s
    "P"
  end

end

module SlidingPiece
  def moves
    select { |pos| is_valid?(pos)}
    #returns an array of valid moves
    # return the MOVES constant where MOVES.each is_valid?(pos)
  end
  private
  def move_dirs()
  end
  def horizontal_dirs
  end
  def diagonal_dirs
  end
  def grow_unblocked_moves_dir(dx, dy)
  end
end

module SteppingPiece
  def moves
  end
  private
  def move_diffs()
  end
end