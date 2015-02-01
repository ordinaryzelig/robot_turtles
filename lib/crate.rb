class Crate

  include Tile
  include Moveable
  include StopsLaser

  def move(direction)
    if crate_ahead = space_to_the(direction).find(Crate)
      raise BumpedIntoObject.new(crate_ahead)
    end
    super
  end

end
