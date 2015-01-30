class Board < SimpleDelegator

  def initialize
    matrix = Matrix.build(8, 8) do |row, col|
      space = Space.new
      space.row = row
      space.col = col
      space
    end
    super matrix
  end

end
