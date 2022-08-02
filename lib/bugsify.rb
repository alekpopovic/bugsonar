# frozen_string_literal: true

require_relative "./bugsify/version"
require_relative "./bugsify/config"
require_relative './bugsify/constants'
require_relative "./bugsify/logger"

module Bugsify 
  class << self
    def config
      @config ||= Config.new
    end

    def configure(&block)
      yield(config)
    end

    def notify(data = {})
      req = HTTParty.post(
        Bugsify::Constants::API_COLLECTOR_ENDPOINT,
        headers: {
          Bugsify::Constants::API_APPLICATION_UID_KEY => @config.application_uid,
          Bugsify::Constants::API_APPLICATION_SECRET_KEY => @config.application_secret,
        },
        body: {
          data: data,
          app_env: Rails.env
        }
      )
    end
  end
end
