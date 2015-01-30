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

end
