$LOAD_PATH.unshift __dir__ + '/../lib'

require 'robot_turtles'

Bundler.require :test
require 'minitest/autorun'
