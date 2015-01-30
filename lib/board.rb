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
    element(row, col)
  end

  def place(tile, row, col)
    space_at(row, col).content = tile
  end

end
