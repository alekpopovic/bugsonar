# frozen_string_literal: true

if defined?(Rails::Application)
  module Bugsify
    class RailsMiddleware
      include ::DefaultNotifier

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
        if request.show_exceptions?
          notify(payload)
          raise e
        else
          notify(payload)
          raise e
        end
      end
    end

    class BugsifyEngine < Rails::Engine
      initializer "bugsify_engine.add_middleware" do |app|
        app.middleware.use Bugsify::RailsMiddleware
      end
    end
  end
end
