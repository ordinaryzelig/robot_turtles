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
    if about_to_move_off_board?
      raise TriedToMoveOffBoard.new(coords, @facing)
    elsif about_to_bump_into_stone_wall? || about_to_bump_into_ice_wall?
      raise BumpedIntoObject.new(space_ahead.content)
    end
    space_ahead.content = self
  end

  def face(direction)
    @facing = direction
  end

  def faces?(direction)
    @facing == direction
  end

  def turn_right
    new_dir =
      case @facing
      when :north then :east
      when :east  then :south
      when :south then :west
      when :west  then :north
      end
    face new_dir
  end

  def turn_left
    new_dir =
      case @facing
      when :north then :west
      when :east  then :north
      when :south then :east
      when :west  then :south
      end
    face new_dir
  end

private

  def space_ahead
    space.space_to_the(@facing)
  end

  class IllegalMovement < StandardError
  end

  class TriedToMoveOffBoard < IllegalMovement
    def initialize(current_coords, attempted_direction)
      super "Turtle at #{current_coords.inspect} tried to move #{attempted_direction.inspect}, which is off the board"
    end
  end

  class BumpedIntoObject < IllegalMovement
    attr_reader :object
    def initialize(object)
      @object = object
      super "Turtle bumped into #{object.class} at #{object.coords.inspect}"
    end
  end

  def about_to_move_off_board?
    space_ahead.off_board?
  end

  def about_to_bump_into_stone_wall?
    space_ahead.content.is_a?(StoneWall)
  end

  def about_to_bump_into_ice_wall?
    space_ahead.content.is_a?(IceWall) && !space_ahead.content.melted
  end

end
