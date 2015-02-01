require_relative 'helper'

describe Program do

  it 'runs on a Board, applying cards to the Turtle' do
    turtle = Turtle.new(:blue, :east)

    cards = []
    cards << MoveForward.new
    cards << TurnRight.new
    cards << MoveForward.new
    cards << TurnLeft.new
    cards << MoveForward.new

    program = Program.new(cards, turtle)

    board = Board.new
    board.place turtle, 0, 0
    program.run

    turtle.coords.must_equal [1, 2]
  end

end
