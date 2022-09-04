# frozen_string_literal: true

if Gem.loaded_specs.has_key?("padrino")
  require_relative '../notifiers/default_notifier'

  module Bugsify
    module Middleware
      class Padrino
        def initialize(app)
          @app = app
        end

        def call(env)
          request = Rack::Request.new(env)
          @app.call(env)
        rescue StandardError => e
          notify(e)
          raise e
        end
      end
    end
  end
end
