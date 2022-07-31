# frozen_string_literal: true

require 'rails/generators'

module Bugsify
  module Generators
    class Install < Rails::Generators::Base
      def insert_path
        klazz = 'class Application < Rails::Application'
        bugsify_klazz = 'Bugsify::Logger'
        insert_into_file 'config/application.rb', after: "#{klazz}\n" do
          "    config.middleware.use #{bugsify_klazz}\n"
        end
      end

      def create_helper_file
        create_file "config/initializers/bugsify.rb", <<-FILE
# frozen_string_literal: true

Bugsify::Config.instance.setup do |config|
  config.application_uid = ""
  config.application_secret = ""
end
        FILE
      end
    end
  end
end