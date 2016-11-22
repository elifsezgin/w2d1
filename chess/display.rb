require "colorize"
require_relative "board"
require_relative "cursor"
require_relative "pieces/require_pieces"
require "byebug"

class Display
  attr_reader :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def display_get_input
    5.times do
      render
      check_var = cursor.get_input
    end
  end

  def render
    empty_string = ""
    @board.rows.each_with_index do |row, idx1|
      row.each_with_index do |cell, idx2|
        cell = cell.value
        if [idx1, idx2] == @cursor.cursor_pos
          cell = cell.colorize(:red)
          if @cursor.selected == true
            cell = cell.colorize(:blue)
          end
        end
        empty_string << cell
      end
      empty_string << "\n"
    end
    puts empty_string
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.display_get_input
end
