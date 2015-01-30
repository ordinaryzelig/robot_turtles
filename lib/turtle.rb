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
