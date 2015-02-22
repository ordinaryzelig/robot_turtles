class IceWall < Wall

  attr_reader :melted

  def initialize
    @melted = false
  end

  def melt
    @melted = true
  end

  def stops_laser?
    !melted
  end

  def to_map
    melted ? 'P' : 'I'
  end

end
