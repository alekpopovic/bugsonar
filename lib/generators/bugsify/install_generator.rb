# frozen_string_literal: true

if Gem.loaded_specs.has_key?("rails")
  require "rails/generators"

  module Bugsify
    module Generators
      # Install
      class Install < Rails::Generators::Base
        def create_helper_file
          create_file "config/initializers/bugsify.rb", <<-FILE
# frozen_string_literal: true

Bugsify.configure do |config|
  config.api_key = ""
  config.api_secret = ""
end
          FILE
        end
      end
    end
  end
end
