# frozen_string_literal: true

if Gem.loaded_specs.has_key?("sinatra")
  require_relative '../notifiers/default_notifier'

  module Bugsify
    class SinatraMiddleware
      include Bugsify::DefaultNotifier

      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      rescue StandardError => e
        notify(e)
        raise e
      end
    end
  end
end
