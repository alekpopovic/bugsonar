# frozen_string_literal: true

if Gem.loaded_specs.key?("rails")
  require "rails/generators"

  module Bugsonar
    module Generators
      class Install < Rails::Generators::Base
        # rubocop:disable Layout/HeredocIndentation
        def create_helper_file
          create_file("config/initializers/bugsonar.rb", <<-FILE)
# frozen_string_literal: true

Bugsonar.configure do |config|
  config.api_url = ""
  config.api_key_name = ""
  config.api_key = ""
end
          FILE
        end
        # rubocop:enable Layout/HeredocIndentation
      end
    end
  end
end
