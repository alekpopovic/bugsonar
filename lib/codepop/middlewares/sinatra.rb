# frozen_string_literal: true

if Gem.loaded_specs.key?("sinatra")
  require_relative "../reporters/rack"

  module Codepop
    module Middleware
      # Sinatra
      class Sinatra
        include Codepop::Reporter::Rack

        def initialize(app)
          @app = app
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Lint/RescueException
        def call(env)
          @app.call(env)
        rescue Exception => e
          payload = {
            error_class: e.class,
            error_backtrace: e,
            error_full_backtrace: "\n#{e.class}\n#{e.message}\n#{e}",
            runtime_version: {
              padrino: Gem.loaded_specs["sinatra"].version,
              rack: Gem.loaded_specs["rake"].version,
              ruby: RUBY_VERSION
            }
          }
          notify(payload)
          raise e
        end
        # rubocop:enable Metrics/MethodLength
        # rubocop:enable Lint/RescueException
      end
    end
  end
end
