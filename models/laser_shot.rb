class LaserShot

  def initialize(direction, starting_space)
    @direction     = direction
    @current_space = starting_space
  end

  def fire
    loop do
      shot_obj = resolve_current_space
      if shot_obj
        break
      else
        next_space = @current_space.space_to_the @direction
        if next_space.off_board?
          break
        else
          @current_space = next_space
        end
      end
    end
  end

private

  def resolve_current_space
    shot_obj = @current_space.tiles.find(&:stops_laser?)
    shot_obj.melt if shot_obj.is_a?(IceWall) && !shot_obj.melted
    shot_obj
  end

end
