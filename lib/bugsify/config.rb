# frozen_string_literal: true

module Bugsify
  module Config
    def self.included(host_class)
      host_class.extend ClassMethods
    end

    module ClassMethods
      def config
        @config ||= Configuration.new
      end
      
      def configure
        yield config
      end
    end
  
    class Configuration
      attr_accessor :api_key, :api_secret
    end
  end
end
