require 'matrix'
require 'delegate'

# coords are row, col.
# 0,0 is top left
class Board < SimpleDelegator

  def initialize
    matrix = Matrix.build(8, 8) do |row, col|
      space = Space.new(row, col)
      space.board = self
      space
    end
    super matrix
  end

  def space_at(row, col)
    if off_board_coords? row, col
      Space::OffBoard.new(row, col)
    else
      element(row, col)
    end
  end

  def place(tile, row, col)
    space_at(row, col).add tile
  end

private

  def off_board_coords?(row, col)
    [row, col].any? do |coord|
      coord < 0 || coord > 7
    end
  end

end
