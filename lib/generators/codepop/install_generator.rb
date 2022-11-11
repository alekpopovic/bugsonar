# frozen_string_literal: true

if Gem.loaded_specs.key?("rails")
  require "rails/generators"

  module Codepop
    module Generators
      # Install
      class Install < Rails::Generators::Base
        # rubocop:disable Layout/HeredocIndentation
        def create_helper_file
          create_file "config/initializers/codepop.rb", <<-FILE
# frozen_string_literal: true

Codepop.configure do |config|
  config.api_key = ""
end
          FILE
        end
        # rubocop:enable Layout/HeredocIndentation
      end
    end
  end
end
