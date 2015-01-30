class Board < SimpleDelegator

  def initialize
    matrix = Matrix.build(8, 8) do |row, col|
      Space.new(row, col)
    end
    super matrix
  end

  def place(tile, row, col)
    element(row, col).content = tile
  end

end
