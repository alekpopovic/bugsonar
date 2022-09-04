# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Bugsify
  module Notifier
    module Default
      def notify(event)
        # "https://api.bugsify.io/v1/events/collector"
        semaphore = Thread::Mutex.new

        Thread.new {
          semaphore.synchronize {
            uri = URI.parse("http://localhost:4000/v1/events/collector")

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = false

            request = Net::HTTP::Post.new(uri.path, {
              "Content-Type" => "application/json",
              "api_key" => Bugsify.config.api_key,
              "api_secret" => Bugsify.config.api_secret
            })

            request.body = {
              data: {
                errorClass: event[:error_class],
                errorBacktrace: event[:error_backtrace],
                errorFullBacktrace: event[:error_full_backtrace],
                runtimeVersion: event[:runtime_version],
                applicationEnvironment: ENV["RACK_ENV"]
              }
            }.to_json

            http.request(request)
          }
        }
      end
    end
  end
end
