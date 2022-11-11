# frozen_string_literal: true

if Gem.loaded_specs.has_key?("rails")
  require_relative "../reporters/rails"

  module Codepop
    module Middleware
      # Rails
      class Rails
        include Codepop::Reporter::Rails

        def initialize(app)
          @app = app
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Lint/RescueException
        # rubocop:disable Metrics/AbcSize
        def call(env)
          @app.call(env)
        rescue Exception => e
          trace = e.backtrace.select { |l| l.start_with?(Rack::Directory.new("").root) }.join("\n    ")
          payload = {
            error_class: e.class,
            error_backtrace: "\n#{e.class}\n#{e.message}\n#{trace}",
            error_full_backtrace: e.backtrace.select { |l| l }.join("\n    "),
            runtime_version: {
              rails: Gem.loaded_specs["rails"].version,
              rack: Gem.loaded_specs["rake"].version,
              ruby: RUBY_VERSION
            }
          }
          notify(payload)
          raise e
        end
        # rubocop:enable Metrics/MethodLength
        # rubocop:enable Lint/RescueException
        # rubocop:enable Metrics/AbcSize
      end
    end
  end
end
