require_relative 'helper'

describe Program do

  let(:turtle) { Turtle.new(:blue, :east) }
  let(:board)  { Board.new }

  before do
    board.place turtle, 0, 0
  end

  it 'runs on a Board, applying cards to the Turtle' do
    cards = []
    cards << MoveForward.new
    cards << TurnRight.new
    cards << MoveForward.new
    cards << TurnLeft.new
    cards << MoveForward.new

    program = Program.new(cards, turtle)
    program.run

    turtle.coords.must_equal [1, 2]
  end

  it 'can use FunctionFrogs to represent a repeatable pattern of cards' do
    cards = []
    cards << FunctionFrog.new
    cards << TurnLeft.new
    cards << FunctionFrog.new

    program = Program.new(cards, turtle)

    turtle.function_frog_cards = [
      MoveForward.new,
      MoveForward.new,
      TurnRight.new,
      MoveForward.new,
    ]

    program.run

    turtle.coords.must_equal [2, 4]
  end

end
