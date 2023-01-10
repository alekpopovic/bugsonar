# frozen_string_literal: true

module Bugsify
  # Middleware
  class Middleware
    include Parser

    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue Exception => e
      Gem.loaded_specs.key?("rails") ? rails(e) : rack(e)
    end
  end
end
