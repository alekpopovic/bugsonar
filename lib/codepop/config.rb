# frozen_string_literal: true

require "uri"

module Codepop
  # Config
  module Config
    PRODUCTION_API_ENDPOINT = "https://api.codepop.co.rs/v1/"
    DEVELOPMENT_API_ENDPOINT = "http://localhost/v1/"

    class << self
      def api(uri)
        case ENV.fetch("RACK_ENV", nil)
        when "production"
          URI.parse("#{PRODUCTION_API_ENDPOINT}#{uri}")
        when "development"
          URI.parse("#{DEVELOPMENT_API_ENDPOINT}#{uri}")
        end
      end

      def use_ssl
        case ENV.fetch("RACK_ENV", nil)
        when "production"
          true
        when "development"
          false
        end
      end
    end

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

    class Configuration
      attr_accessor :api_key
    end
  end
end
