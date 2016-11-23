require "byebug"
require_relative "piece"

class Pawn < Piece

  def initialize(board, position, color)
    super(board, position, color)
  end

  def symbol
    color == :white ? "\u2659" : "\u265F"
  end

  def moves
    if color == :white
      directions = (position[0] == 6) ? [[-1, 0], [-2, 0]] : [[-1, 0]]
      diagonals = [[-1, -1], [-1, 1]]
      opposite_color = :black
      moves = moves_helper(directions, diagonals, opposite_color)
    else
      directions = (position[0] == 1) ? [[1, 0], [2, 0]] : [[1, 0]]
      diagonals = [[1, -1], [1, 1]]
      opposite_color = :white
      moves = moves_helper(directions, diagonals, opposite_color)
    end

    moves.select do |pos|
      pos[0].between?(0, 7) && pos[1].between?(0, 7)
    end

    moves
  end

  def moves_helper(directions, diagonals, opposite_color)
    moves = []
    directions.each do |pos|
      move = possible_move(pos[0], pos[1])
      moves << move unless move.nil?
    end
    diagonals.each do |pos|
      diag_pos = [pos[0] + position[0], pos[1] + position[1]]
      next unless diag_pos.each do |pos|
        pos[0].between?(0, 7) && pos[1].between?(0, 7)
      end
      next if board[diag_pos].class == NullPiece
      if board[diag_pos].color == opposite_color
        moves << diag_pos
      end
    end
    moves
  end

  def possible_move(dx, dy)
    pos = [@position[0] + dx, @position[1] + dy]
    unless @board[pos].class == Piece
      pos
    end
  end
end
