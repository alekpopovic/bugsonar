# frozen_string_literal: true

require 'debug'

if Gem.loaded_specs.has_key?("sinatra")
  require_relative "../reporters/default_reporter"

  module Bugsify
    module Middleware
      class Sinatra
        include Bugsify::Reporter::Default

        def initialize(app)
          @app = app
        end

        def call(env)
          request = Rack::Request.new(env)
          @app.call(env)
        rescue StandardError => e
          debugger
          notify(e)
          raise e
        end
      end
    end
  end
end
