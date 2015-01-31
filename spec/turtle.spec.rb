require_relative 'helper'

describe Turtle do

  let(:turtle) do
    Turtle.new(:blue, :north)
  end

  it 'has a color' do
    turtle.color.must_equal :blue
  end

  it 'faces a direction' do
    turtle.faces?(:north).must_equal true
  end

  it 'can move forward' do
    Board.new.place turtle, 1, 1
    turtle.move_forward
    turtle.coords.must_equal [0, 1]
  end

  it 'can be forced to face a direction' do
    turtle.faces?(turtle.facing).must_equal true

    turtle.face(:south)
    turtle.faces?(:south).must_equal true
  end

  it 'can turn' do
    turtle.face(:north)
    %i[east south west north].each do |expected_dir|
      turtle.turn_right
      turtle.faces?(expected_dir).must_equal true
    end

    %i[west south east north].each do |expected_dir|
      turtle.turn_left
      turtle.faces?(expected_dir).must_equal true
    end
  end

  describe 'illegal movement' do

    let(:board) { Board.new }

    before do
      board.place turtle, 0, 0
    end

    it 'cannot move off the board' do
      turtle.face :north
      proc do
        turtle.move_forward
      end.must_raise Turtle::TriedToMoveOffBoard
    end

    def place_east_of_turtle(obj)
      board.place obj, 0, 1
    end

    def assert_turtle_bumps_into(obj)
      ex =
        proc do
          turtle.move_forward
        end.must_raise Turtle::BumpedIntoObject
      ex.object.must_equal obj
    end

    it 'cannot move forward if StoneWall in the way' do
      turtle.face :east
      wall = StoneWall.new
      place_east_of_turtle wall
      assert_turtle_bumps_into wall
    end

    it 'cannot move forward if IceWall in the way' do
      turtle.face :east
      wall = IceWall.new
      place_east_of_turtle wall
      assert_turtle_bumps_into wall
    end

  end

end
