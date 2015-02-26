require_relative 'load_path'
require 'models'

require 'haml'
require 'sass'

require 'lotus-controller'
require 'lotus-view'
require 'lotus-router'

require 'awesome_print'

Lotus::View.configure do
  root 'view_templates'
end
Lotus::View.load!

module Games

  module Actions
    class Show

      include Lotus::Action

      expose :board

      def call(params)
        @exposures = nil # Bug? https://github.com/lotus/controller/issues/90
        @map   = Map.new(params['map'] || '')
        @board = @map.board

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
