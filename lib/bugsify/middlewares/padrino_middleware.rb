# frozen_string_literal: true

module Bugsify
  class PadrinoMiddleware
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