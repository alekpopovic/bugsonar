# frozen_string_literal: true

if Gem.loaded_specs.key?("rails")
  require "rails/generators"

  module Bugsify
    module Generators
      # Install
      class Install < Rails::Generators::Base
        # rubocop:disable Layout/HeredocIndentation
        def create_helper_file
          create_file "config/initializers/bugsify.rb", <<-FILE
# frozen_string_literal: true

Bugsify.configure do |config|
  config.api_key = ""
end
          FILE
        end
        # rubocop:enable Layout/HeredocIndentation
      end
    end
  end
end
