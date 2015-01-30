require_relative 'helper'

describe Turtle do

  it 'has a color' do
    t = Turtle.new(:blue)
    t.color.must_equal :blue
  end

end
