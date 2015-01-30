class Turtle

  include Tile

  #   turns left
  #   turns right
  #   shoots laser
  #     laser can travel over spaces where there is no object in its way
  #     melts first ice it comes into contact with

  include StopsLaser

  attr_reader :color
  attr_reader :facing

  def initialize(color, facing)
    @color  = color
    @facing = facing
  end

  def move_forward
    space_ahead.content = self
  end

  def can_move_forward?
    space_ahead.free? || thing_directly_ahead.is_a?(Crate) && thing_directly_ahead.can_move?(direction_facing)
  end

  def face(direction)
    @facing = direction
  end

  def faces?(direction)
    @facing == direction
  end

private

  def space_ahead
    space.space_to_the(@facing)
  end

end
