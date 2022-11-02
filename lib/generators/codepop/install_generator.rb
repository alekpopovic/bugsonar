# frozen_string_literal: true

if Gem.loaded_specs.has_key?("rails")
  require "rails/generators"

  module Codepop
    module Generators
      # Install
      class Install < Rails::Generators::Base
        def create_helper_file
          create_file "config/initializers/codepop.rb", <<-FILE
# frozen_string_literal: true

Codepop.configure do |config|
  config.api_key = ""
end
          FILE
        end
      end
    end
  end
end
