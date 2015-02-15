require 'bundler/setup'
Bundler.require

autoload :Board,           'board'
autoload :Card,            'card'
autoload :Crate,           'crate'
autoload :FunctionFrog,    'cards/function_frog'
autoload :IceWall,         'ice_wall'
autoload :Jewel,           'jewel'
autoload :LaserShot,       'laser_shot'
autoload :Moveable,        'moveable'
autoload :MoveForward,     'cards/move_forward'
autoload :Program,         'program'
autoload :Space,           'space'
autoload :StoneWall,       'stone_wall'
autoload :TurnLeft,        'cards/turn_left'
autoload :TurnRight,       'cards/turn_right'
autoload :Turtle,          'turtle'
autoload :Tile,            'tile'
autoload :Wall,            'wall'

# Scenario
#   setup instructions

# Card
#   makes turtle do something
#   can be replaced with function frog
#     function frog represents a pattern
#     ff represents only 1 pattern per scenario
