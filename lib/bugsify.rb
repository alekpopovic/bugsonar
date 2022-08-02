# frozen_string_literal: true

require 'thread'
require 'uri'
require 'net/http'
require 'json'
require "bugsify/version"
require "bugsify/config"
require "bugsify/logger"

module Bugsify 
  class << self
    def config
      @config ||= Config.new
    end

    def configure(&block)
      yield(config)
    end

    def notify(data = {})
      semaphore = Thread::Mutex.new

      Thread.new {
        semaphore.synchronize {
          uri = URI.parse("https://api.bugsify.io/v1/events/collector")

          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true

          request = Net::HTTP::Post.new(uri.path, initheader = {
            'Content-Type' => 'application/json',
            'application_uid' => @config.application_uid,
            'application_secret' => @config.application_secret
          })

          request.body = {
            data: data,
            app_env: Rails.env
          }.to_json

          http.request(request)
        }
      }
    end
  end
end
