class Jewel < Tile

  class << self

    def string(string)
      new(Turtle::COLORS.fetch(Integer(string[1])))
    end

  end

  attr_reader :color

  def initialize(color)
    @color = color
  end

  def to_map
    "J#{Turtle::COLORS.index(color)}"
  end

end
