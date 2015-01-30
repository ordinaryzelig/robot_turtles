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

  it 'cannot move off the board' do
    Board.new.place turtle, 0, 0
    turtle.face :north
    proc do
      turtle.move_forward
    end.must_raise Turtle::TriedToMoveOffBoard
  end

end
