require_relative 'helper'

describe Space do

  it 'can have tiles put in, and tiles will be linked to the space' do
    space = Space.new(0, 0)
    turtle = Turtle.new(:blue, :north)
    space.add turtle
    space.tiles.must_include turtle
    turtle.space.must_equal space
  end

  describe '#free?' do

    it 'returns true if nothing is in it' do
      Space.new(0, 0).must_be :free?
    end

    it 'returns false if tiles would block movement' do
      space = Space.new(0, 0)
      space.add StoneWall.new
      space.wont_be :free?
    end

    it 'returns true if it contains a IceWall, but only if it is melted' do
      space = Space.new(0, 0)
      ice_wall = IceWall.new
      space.add ice_wall
      space.wont_be :free?

      ice_wall.melt
      space.must_be :free?
    end

  end

  it 'can return adjacent Space in given direction' do
    board = Board.new
    space_1_1 = board.space_at(1, 1)

    (north, west, east, south) =
             [0, 1],
      [1, 0],      [1, 2],
             [2, 1]

    %w[north west east south].each do |dir|
      adjacent = space_1_1.space_to_the(dir.to_sym)
      expected_coords = eval dir
      adjacent.coords.must_equal expected_coords, "#{dir.inspect} failed"
    end
  end

  it 'can find an object in its tiles matching a given type' do
    space = Space.new(0, 0)
    ice_wall = IceWall.new
    space.add ice_wall
    space.find(IceWall).must_equal ice_wall
  end

end
