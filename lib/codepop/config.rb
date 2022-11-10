# frozen_string_literal: true

require "uri"

module Codepop
  # Config
  module Config
    API_ENDPOINT = "https://api.codepop.co.rs/v1/"

    class << self
      def api(uri)
        URI.parse("#{API_ENDPOINT}#{uri}")
      end

      def use_ssl
        case ENV["RACK_ENV"]
        when "production"
          true
        when "development"
          false
        else
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
