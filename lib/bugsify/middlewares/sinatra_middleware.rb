# frozen_string_literal: true

if Gem.loaded_specs.has_key?("sinatra")

  module Bugsify
    class SinatraMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      rescue StandardError => e
        Bugsify.notify(e)
        raise e
      end
    end
  end
  
end