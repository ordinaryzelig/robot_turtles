class Turtle < Tile

  include Moveable

  attr_reader   :color
  attr_reader   :facing
  attr_accessor :function_frog_cards

  def initialize(color, facing)
    @color  = color
    @facing = facing
  end

  def face(direction)
    @facing = direction
  end

  def faces?(direction)
    @facing == direction
  end

  def on_jewel?
    space.contains?(Jewel)
  end

  ##############
  # Card Methods

  def MoveForward
    move_crate_ahead if crate_ahead
    move(@facing)
  end

  def TurnRight
    new_dir =
      case @facing
      when :north then :east
      when :east  then :south
      when :south then :west
      when :west  then :north
      end
    face new_dir
  end

  def TurnLeft
    new_dir =
      case @facing
      when :north then :west
      when :east  then :north
      when :south then :east
      when :west  then :south
      end
    face new_dir
  end

  def ShootLaser
    laser_shot = LaserShot.new(@facing, space_ahead)
    laser_shot.fire
  end

  def FunctionFrog
    function_frog_cards.each do |card|
      card.play self
    end
  end

private

  def space_ahead
    space.space_to_the(@facing)
  end

  def crate_ahead
    space_ahead.find(Crate)
  end

  def move_crate_ahead
    begin
      crate_ahead.move(@facing) if crate_ahead
    rescue BumpedIntoObject => ex
      # Crate ahead bumped into another crate.
      # We want to raise the exception for the crate ahead.
      if ex.object.is_a? Crate
        raise BumpedIntoObject.new(crate_ahead)
      else
        raise
      end
    end
  end

end
