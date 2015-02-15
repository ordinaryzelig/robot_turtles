require_relative 'helper'

describe Tile do

  it 'is attached to a Space' do
    space = Space.new(0, 0)
    wall = StoneWall.new
    wall.space = space
    wall.space.must_equal space
  end

  it 'has coordinates' do
    space = Space.new(1, 2)
    wall = StoneWall.new
    wall.space = space
    wall.coords.must_equal [1, 2]
  end

end
