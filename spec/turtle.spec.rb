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

  it 'can be forced to face a direction' do
    turtle.faces?(turtle.facing).must_equal true

    turtle.face(:south)
    turtle.faces?(:south).must_equal true
  end

  it 'can turn' do
    turtle.face(:north)
    %i[east south west north].each do |expected_dir|
      turtle.TurnRight
      turtle.faces?(expected_dir).must_equal true
    end

    %i[west south east north].each do |expected_dir|
      turtle.TurnLeft
      turtle.faces?(expected_dir).must_equal true
    end
  end

  describe 'movement' do

    let(:board) { Board.new }

    before do
      board.place turtle, 0, 0
    end

    it 'can move forward, leaving the previous space' do
      old_space = turtle.space
      turtle.face :east
      turtle.MoveForward
      turtle.coords.must_equal [0, 1]
      old_space.tiles.must_be_empty
    end

    it 'cannot move off the board' do
      turtle.face :north
      proc do
        turtle.MoveForward
      end.must_raise Turtle::TriedToMoveOffBoard
    end

    def place_east_of_turtle(obj)
      board.place obj, 0, 1
    end

    def assert_turtle_bumped_into(obj)
      ex =
        proc do
          turtle.MoveForward
        end.must_raise Moveable::BumpedIntoObject
      ex.object.must_equal obj
    end

    it 'cannot move forward if StoneWall in the way' do
      turtle.face :east
      wall = StoneWall.new
      place_east_of_turtle wall
      assert_turtle_bumped_into wall
    end

    it 'cannot move forward if IceWall in the way' do
      turtle.face :east
      wall = IceWall.new
      place_east_of_turtle wall
      assert_turtle_bumped_into wall
    end

    it 'can move onto a space with a jewel' do
      turtle.face :east
      jewel = Jewel.new
      place_east_of_turtle jewel
      turtle.MoveForward
      turtle.must_be :on_jewel?
    end

    describe 'with crate ahead' do

      let(:crate) { Crate.new }

      before do
        place_east_of_turtle crate
        turtle.face :east
      end

      it 'can push a crate that can be legally pushed' do
        turtle.MoveForward
        turtle.coords.must_equal [0, 1]
        crate.coords.must_equal [0, 2]
      end

      it 'cannot push a crate that cannot be moved legally' do
        ice_wall = IceWall.new
        board.place ice_wall, 0, 2
        assert_turtle_bumped_into ice_wall
      end

      it 'cannot push a crate with another crate behind it' do
        another_crate = Crate.new
        board.place another_crate, 0, 2
        assert_turtle_bumped_into crate
      end

    end

  end

end
