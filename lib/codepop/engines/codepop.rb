# frozen_string_literal: true

if Gem.loaded_specs.has_key?("rails")
  require_relative "../middlewares/rails"

  module Codepop
    # CodepopEngine
    class CodepopEngine < Rails::Engine
      initializer "codepop_engine.add_middleware" do |app|
        app.middleware.use Codepop::Middleware::Rails
      end
    end
  end
end
