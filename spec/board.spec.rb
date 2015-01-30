require_relative 'helper'

describe Board do

  it 'builds an 8x8 matrix of Spaces' do
    board = Board.new
    board.row_count.must_equal 8
    board.column_count.must_equal 8
    board.each.to_a.map(&:class).uniq.must_equal [Space]
  end

end
