require_relative 'load_path'
require 'models'

require 'haml'
require 'sass'

require 'lotus-controller'
require 'lotus-view'
require 'lotus-router'

Lotus::View.configure do
  root 'view_templates'
end
Lotus::View.load!

module Games

  module Actions
    class Show

      include Lotus::Action

      expose :board
      expose :turtle

      def call(params)
        @board = Board.new

        @turtle = Turtle.new(:blue, :east)
        @board.place @turtle, 0, 0

        @board.place IceWall.new,             0, 1
        @board.place Crate.new,               0, 2
        @board.place IceWall.new.tap(&:melt), 0, 3
        @board.place StoneWall.new,           0, 4
        @board.place Jewel.new,               0, 5

        self.body = Games::Show.render(format: :html, **exposures)
      end

    end
  end

  class Show
    include Lotus::View
    layout :application
  end

end

class ApplicationLayout
  include Lotus::Layout
end

class Stylesheets

  include Lotus::Action

  def call(params)
    self.body = Application.render(format: :css)
  end

  class Application
    include Lotus::View
  end

end

RobotTurtles =
  Lotus::Router.new do
    get '/', to: Games::Actions::Show
    get '/application.css', to: Stylesheets
  end
