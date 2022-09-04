# frozen_string_literal: true

if Gem.loaded_specs.has_key?("rails")
  require_relative "../middlewares/rails_middleware"

  module Bugsify
    # BugsifyEngine
    class BugsifyEngine < Rails::Engine
      initializer "bugsify_engine.add_middleware" do |app|
        app.middleware.use Bugsify::Middleware::Rails
      end
    end
  end
end
