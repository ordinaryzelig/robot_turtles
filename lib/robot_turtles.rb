require 'bundler/setup'
Bundler.require

module StopsLaser
end

class Turtle

  include StopsLaser

  attr_reader :color

  def initialize(color)
    @color = color
  end
  #   moves forward
  def can_move_forward?
    space_ahead.free? || thing_directly_ahead.is_a?(Crate) && thing_directly_ahead.can_move?(direction_facing)
  end
  #   turns left
  #   turns right
  #   shoots laser
  #     laser can travel over spaces where there is no object in its way
  #     melts first ice it comes into contact with
end

class Crate

  include StopsLaser

  def can_move?(direction)
    space_to_the(direction).free?
  end

end

class IceWall

  include StopsLaser
#   can be melted by laser
end

class StoneWall

  include StopsLaser

end

class Jewel

  include StopsLaser

end

class Space

  attr_accessor :row
  attr_accessor :col

  def free?
    content.nil? || content.is_a?(IceWall) && content.melted?
  end

end

require 'matrix'
require 'delegate'

class Board < SimpleDelegator

  def initialize
    matrix = Matrix.build(8, 8) do |row, col|
      space = Space.new
      space.row = row
      space.col = col
      space
    end
    super matrix
  end

end

# Scenario
#   setup instructions

# Card
#   makes turtle do something
#   can be replaced with function frog
#     function frog represents a pattern
#     ff represents only 1 pattern per scenario
