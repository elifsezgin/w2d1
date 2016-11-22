module SlidingPiece

  def moves()
    piece_moves = move_dirs()

    piece_moves.select do |pos|
      pos[0].between?(0, 7) && pos[1].between?(0, 7)
    end
  end

  def move_dirs()
    all_directions = []
    if horizontal && diagonal
      horizontal_dirs.each do |pos|
        all_directions.concat(grow_unblocked_moves_dir(pos[0], pos[1]))
      end
      diagonal_dirs.each do |pos|
        all_directions.concat(grow_unblocked_moves_dir(pos[0], pos[1]))
      end
    elsif horizontal
      horizontal_dirs.each do |pos|
        all_directions.concat(grow_unblocked_moves_dir(pos[0], pos[1]))
      end
    else
      diagonal_dirs.each do |pos|
        all_directions.concat(grow_unblocked_moves_dir(pos[0], pos[1]))
      end
    end

    all_directions
  end

  def horizontal_dirs
    [
      [0,1],
      [0,-1],
      [-1, 0],
      [1, 0]
    ]
  end

  def diagonal_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]

  end

  def grow_unblocked_moves_dir(dx, dy)
    move_directions = []
    i = 1
    until i == 8
      pos = [@position[0] + dx * i, @position[1] + dy * i]
      break if @board[pos].class == Piece && @board[pos].color == @color
      move_directions << pos
      break if @board[pos].class == Piece && @board[pos].color != @color
      i += 1
    end
    move_directions
  end
end
