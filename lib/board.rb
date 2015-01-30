class Board < SimpleDelegator

  def initialize
    matrix = Matrix.build(8, 8) do |row, col|
      Space.new(row, col)
    end
    super matrix
  end

end
