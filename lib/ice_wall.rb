class IceWall

  include Tile
  include StopsLaser

  attr_reader :melted

  def initialize
    @melted = false
  end

  def melt
    @melted = true
  end

end
