# frozen_string_literal: true

if Gem.loaded_specs.key?("rails")
  require "rails"
  require_relative "../middlewares/rails"

  module Bugsify
    # BugsifyEngine
    class BugsifyEngine < Rails::Engine
      initializer "bugsify_engine.add_middleware" do |app|
        app.middleware.use Bugsify::Middleware::Rails
      end
    end
  end
end
