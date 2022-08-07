# frozen_string_literal: true

if defined?(Rails::Application)
  module Bugsify
    class RailsMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        request = ActionDispatch::Request.new env
        @app.call(env)
      rescue Exception => error
        trace = error.backtrace.select { |l| l.start_with?(Rails.root.to_s) }.join("\n    ")
        payload =  {
          error_class: error.class,
          error_backtrace: "\n#{error.class}\n#{error.message}\n#{trace}",
          error_full_backtrace: error.backtrace.select { |l| l }.join("\n    "),
          runtime_version: {
            rails: Gem.loaded_specs["rails"].version,
            rack: Gem.loaded_specs["rake"].version,
            ruby: RUBY_VERSION,
          },
        }
        if request.show_exceptions?
          Bugsify.notify(payload)
          raise error
        else
          Bugsify.notify(payload)
          raise error
        end
      end
    end
  end
end