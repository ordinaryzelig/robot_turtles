module Moveable

  def about_to_move_off_board?(direction)
    space_to_the(direction).off_board?
  end

  def about_to_bump_into_stone_wall?(direction)
    space_to_the(direction).contains?(StoneWall)
  end

  def about_to_bump_into_ice_wall?(direction)
    ice_wall = space_to_the(direction).find(IceWall) and !ice_wall.melted
  end

  def can_move?(direction)
    space_to_the(direction).free?
  end

  def move(direction)
    destination_space = space.space_to_the(direction)

    if about_to_move_off_board?(direction)
      raise TriedToMoveOffBoard.new(coords, @facing)
    elsif about_to_bump_into_stone_wall?(direction) || about_to_bump_into_ice_wall?(direction)
      raise BumpedIntoObject.new(destination_space.find(Wall))
    end

    space.remove          self
    destination_space.add self
  end

private

  def space_to_the(direction)
    space.space_to_the(direction)
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

end
