# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Codepop
  module Reporter
    # Rails
    module Rails
      def notify(event)
        semaphore = Thread::Mutex.new

        Thread.new {
          semaphore.synchronize {
            uri = URI.parse("https://api.codepop.co.rs/v1/collectors/ruby")

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true

            request = Net::HTTP::Post.new(uri.path, {
              "Content-Type" => "application/json",
              "Api-Key" => Codepop.config.api_key
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
