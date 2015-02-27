require_relative 'load_path'
require 'models'

require 'haml'
require 'sass'

require 'lotus-router'
require 'lotus-controller'
require 'lotus-view'

require 'awesome_print'

Lotus::View.configure do
  root 'view_templates'
end
Lotus::View.load!

module Games

  class Show

    include Lotus::View
    layout :application

    def self.call(params)
      Action.new.call(params)
    end

    class Action

      include Lotus::Action

      expose :board

      def call(params)
        @map   = Map.new(params['map'] || '')
        @board = @map.board

        self.body = Show.render(format: :html, **exposures)
      end

    end

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
    get '/', to: Games::Show
    get '/application.css', to: Stylesheets
  end
