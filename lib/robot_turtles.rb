require 'bundler/setup'
Bundler.require

autoload :Board,     'board'
autoload :IceWall,   'ice_wall'
autoload :Space,     'space'
autoload :StoneWall, 'stone_wall'
autoload :Turtle,    'turtle'
autoload :Tile,      'tile'

module StopsLaser
end

class Crate

  include StopsLaser

  def can_move?(direction)
    space_to_the(direction).free?
  end

end

class Jewel

  include StopsLaser

end

require 'matrix'
require 'delegate'

# Scenario
#   setup instructions

# Card
#   makes turtle do something
#   can be replaced with function frog
#     function frog represents a pattern
#     ff represents only 1 pattern per scenario
