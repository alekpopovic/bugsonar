# frozen_string_literal: true

if Gem.loaded_specs.has_key?("rails")
  require_relative "../middlewares/rails"

  module Cdp
    # BugsifyEngine
    class CdpEngine < Rails::Engine
      initializer "cdp_engine.add_middleware" do |app|
        app.middleware.use Cdp::Middleware::Rails
      end
    end
  end
end
