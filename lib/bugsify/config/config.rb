# frozen_string_literal: true

module Bugsify
  # Config
  module Config
    def self.included(host_class)
      host_class.extend ClassMethods
    end

    # ClassMethods
    module ClassMethods
      def config
        @config ||= Configuration.new
      end

      def configure
        yield config
      end
    end

    extend ClassMethods

    # Configuration
    class Configuration
      attr_accessor :api_key
    end

    specs = {
      name: "bugsify",
      version: "2.0.0",
      authors: ["Aleksandar Popovic"],
      email: ["aleksandar.popovic@hotmail.com"],
      summary: "Ruby notifier for codepop.co.rs",
      description: "Bugsify error monitoring & exception reporter for Ruby",
      homepage: "https://github.com/codepoptech/bugsify-ruby",
      license: "MIT",
      required_ruby_version: ">= 2.6.0",
      source_code_uri: "https://github.com/codepoptech/bugsify-ruby",
      changelog_uri: "https://github.com/codepoptech/bugsify-ruby/blob/main/CHANGELOG.md"
    }

    specs.each { |k, v| const_set(k.upcase, v) }
  end
end
