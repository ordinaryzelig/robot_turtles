require_relative 'helper'

describe LaserShot do

  let(:board)  { Board.new }
  let(:turtle) { Turtle.new :blue, :east }

  before do
    board.place turtle, 0, 0
  end

  it 'melts an IceWall' do
    ice_wall = IceWall.new
    board.place ice_wall, 0, 1
    turtle.ShootLaser
    ice_wall.must_be :melted
  end

  it 'stops at any obstacle' do
    stone_wall = StoneWall.new
    board.place stone_wall, 0, 1

    ice_wall = IceWall.new
    board.place ice_wall, 0, 2

    turtle.ShootLaser

    ice_wall.wont_be :melted
  end

  it 'shoots over melted IceWalls' do
    ice_walls =
      2.times.map do |idx|
        ice_wall = IceWall.new
        board.place ice_wall, 0, idx + 1
        ice_wall
      end
    ice_walls.first.melt

    turtle.ShootLaser

    ice_walls.map(&:melted).must_equal [true, true]
  end

end
