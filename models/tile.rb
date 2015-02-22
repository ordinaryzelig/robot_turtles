class Tile

  MAP_LEGEND = {
    Crate:          'C',
    IceWall:        'I',
    MeltedIceWall:  'P',
    Jewel:          /J[0-3]/,
    Turtle:         /T[0-3][NESW]/,
    StoneWall:      'W',
  }

  class << self

    def string(str)
      MAP_LEGEND.each do |tile_class_name, pattern|
        if str.upcase.match pattern
          tile_class = const_get tile_class_name
          tile =
            if tile_class.methods(false).include? :string
              tile_class.string(str)
            else
              tile_class.new
            end
          return tile
        end
      end
      raise "Unknown Tile string: #{str.inspect}"
    end

  end

  attr_accessor :space

  def coords
    space.coords
  end

  def inspect
    "<#{self.class} coords=#{coords.inspect}>"
  end

  def stops_laser?
    true
  end

  def to_map
    MAP_LEGEND.fetch(self.class.name.to_sym)
  end

end
