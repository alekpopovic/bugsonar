# frozen_string_literal: true

if Gem.loaded_specs.key?("rails")
  require "rails"

  module Bugsonar
    class Engine < Rails::Engine
      initializer "bugsonar_engine.add_middleware" do |app|
        app.middleware.use(Middleware)
      end
    end
  end
end
