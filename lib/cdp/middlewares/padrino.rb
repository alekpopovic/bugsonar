# frozen_string_literal: true

if Gem.loaded_specs.has_key?("padrino")
  require_relative "../reporters/rack"

  module Cdp
    module Middleware
      # Padrino
      class Padrino
        include Cdp::Reporter::Rack

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
              padrino: Gem.loaded_specs["padrino"].version,
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
