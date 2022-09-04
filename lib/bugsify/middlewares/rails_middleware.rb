# frozen_string_literal: true

if Gem.loaded_specs.has_key?("rails")
  require_relative "../notifiers/default_notifier"

  module Bugsify
    module Middleware
      # Rails
      class Rails
        include Bugsify::DefaultNotifier

        def initialize(app)
          @app = app
        end

        def call(env)
          request = ActionDispatch::Request.new env
          @app.call(env)
        rescue Exception => e
          trace = e.backtrace.select { |l| l.start_with?(Rails.root.to_s) }.join("\n    ")
          payload = {
            error_class: e.class,
            error_backtrace: "\n#{e.class}\n#{e.message}\n#{trace}",
            error_full_backtrace: e.backtrace.select { |l| l }.join("\n    "),
            runtime_version: {
              rails: Gem.loaded_specs["rails"].version,
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
