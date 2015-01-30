require_relative 'helper'

describe Space do

  it 'can have content put in, and content will be linked to the space' do
    space = Space.new(0, 0)
    turtle = Turtle.new(:blue)
    space.content = turtle
    space.content.must_equal turtle
    turtle.space.must_equal space
  end

  describe '#free?' do

    it 'returns true if nothing is in it' do
      Space.new(0, 0).must_be :free?
    end

    it 'returns false if content would block movement' do
      space = Space.new(0, 0)
      space.content = StoneWall.new
      space.wont_be :free?
    end

    it 'returns true if it contains a IceWall, but only if it is melted' do
      space = Space.new(0, 0)
      ice_wall = IceWall.new
      space.content = ice_wall
      space.wont_be :free?

      ice_wall.melt
      space.must_be :free?
    end

  end

end
