class Space

  attr_reader :row
  attr_reader :col
  attr_reader :tiles
  attr_writer :board

  def initialize(row, col)
    @row     = row
    @col     = col
    @tiles = []
  end

  def free?
    tiles.empty? || has_melted_ice_wall?
  end

  def add(thing)
    @tiles << thing
    thing.space = self
  end

  def remove(thing)
    @tiles.delete thing
    thing.space = nil
  end

  def contains?(type)
    !!find(type)
  end

  def find(type)
    tiles.find do |obj|
      obj.is_a? type
    end
  end

  def coords
    [row, col]
  end

  def space_to_the(dir)
    new_row =
      case dir
      when :north
        row - 1
      when :south
        row + 1
      else
        row
      end
    new_col =
      case dir
      when :east
        col + 1
      when :west
        col - 1
      else
        col
      end
    @board.space_at(new_row, new_col)
  end

  def off_board?
    false
  end

private

  def has_melted_ice_wall?
    ice_wall = find(IceWall) and ice_wall.melted
  end

  class OffBoard < Space

    def off_board?
      true
    end

  end

end
