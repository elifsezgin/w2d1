class Piece
  attr_reader :value

  def initialize
    @value = "1"
  end

  def color
  end

  def to_s
    "P"
  end
end
