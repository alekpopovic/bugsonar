# frozen_string_literal: true

if Gem.loaded_specs.key?("rails")
  require "rails"

  module Bugsify
    class BugsifyEngine < Rails::Engine
      initializer "bugsify_engine.add_middleware" do |app|
        app.middleware.use(Middleware)
      end
    end
  end
end
