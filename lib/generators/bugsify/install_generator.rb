# frozen_string_literal: true

require 'rails/generators'

module Bugsify
  module Generators
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