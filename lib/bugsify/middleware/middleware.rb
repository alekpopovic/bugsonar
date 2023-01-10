# frozen_string_literal: true

module Bugsify
  # Middleware
  class Middleware
    include Parser

    def initialize(app)
      @app = app
    end

    # rubocop:disable Lint/RescueException
    def call(env)
      @app.call(env)
    rescue Exception => e
      if Gem.loaded_specs.key?("rails")
        rails_framework(e)
      elsif Gem.loaded_specs.key?("padrino")
        padrino_framework(e)
      elsif Gem.loaded_specs.key?("sinatra")
        sinatra_framework(e)
      end
      # rubocop:enable Lint/RescueException
    end
  end
end
