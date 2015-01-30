require_relative 'helper'

describe Board do

  let(:board) do
    Board.new
  end

  it 'builds an 8x8 matrix of Spaces' do
    board.row_count.must_equal 8
    board.column_count.must_equal 8
    board.each.to_a.map(&:class).uniq.must_equal [Space]
  end

  it 'can place a tile on a space' do
    wall = StoneWall.new
    board.place wall, 0, 0
    tile = board.element(0, 0).content
    tile.must_equal wall
    tile.coords.must_equal [0, 0]
  end

end
