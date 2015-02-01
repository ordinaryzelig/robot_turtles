class Tile

  attr_accessor :space

  def coords
    space.coords
  end

  def inspect
    "<#{self.class} coords=#{coords.inspect}>"
  end

end
