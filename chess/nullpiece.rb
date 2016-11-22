class NullPiece < Piece
  include Singleton

  attr_reader :value

  def initialize
    @value = "0"
  end

  def color
  end

  def to_s
    "N"
  end
end
