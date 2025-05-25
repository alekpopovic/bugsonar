# frozen_string_literal: true

module Bugsonar
  class Middleware
    include Parser

    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue => e
      Gem.loaded_specs.key?("rails") ? rails(e) : rack(e)
    end
  end
end
