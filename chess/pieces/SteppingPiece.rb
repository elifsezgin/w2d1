require "byebug"

module SteppingPiece

  def moves()
    piece_moves = move_diffs

    piece_moves.select do |pos|
      pos[0].between?(0, 7) && pos[1].between?(0, 7)
    end
  end

  private

  def move_diffs
    move_array = []
    directions.each do |direction|
       move = possible_move(direction[0], direction[1])
       move_array << move unless move.nil?
    end

    move_array
  end

  def possible_move(dx, dy)
    pos = [@position[0] + dx, @position[1] + dy]
    unless @board[pos].class == Piece && @board[pos].color == @color
      pos
    end
  end

end
