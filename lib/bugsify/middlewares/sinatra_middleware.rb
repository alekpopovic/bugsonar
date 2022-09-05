# frozen_string_literal: true

if Gem.loaded_specs.has_key?("sinatra")
  require_relative "../reporters/rack_reporter"

  module Bugsify
    module Middleware
      class Sinatra
        include Bugsify::Reporter::Rack

        def initialize(app)
          @app = app
        end

        def call(env)
          # request = Rack::Request.new(env)
          @app.call(env)
        rescue Exception => e
          payload = {
            error_class: e.class,
            error_backtrace: e,
            error_full_backtrace: "\n#{e.class}\n#{e.message}\n#{e}",
            runtime_version: {
              padrino: Gem.loaded_specs["sinatra"].version,
              rack: Gem.loaded_specs["rake"].version,
              ruby: RUBY_VERSION,
            },
          }
          notify(payload)
          raise e
        end
      end
    end
  end
end
