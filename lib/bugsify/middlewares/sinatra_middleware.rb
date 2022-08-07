# frozen_string_literal: true

if Gem.loaded_specs.has_key?("sinatra")
  module Bugsify
    class SinatraMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      rescue StandardError => error
        Bugsify.notify(error)
        raise error
      end
    end
  end
end