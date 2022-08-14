# frozen_string_literal: true

require "uri"
require "net/http"
require "json"
require "bugsify/version"
require "bugsify/config"
require "bugsify/middlewares/rails_middleware" if defined?(Rails::Application)
require "bugsify/middlewares/sinatra_middleware" if Gem.loaded_specs.has_key?("sinatra")
require "bugsify/middlewares/padrino_middleware"

module Bugsify
  class << self
    def config
      @config ||= Config.new
    end

    def configure(&block)
      yield(config)
    end

    def notify(event)
      semaphore = Thread::Mutex.new

      Thread.new {
        semaphore.synchronize {
          uri = URI.parse("https://api.bugsify.io/v1/events/collector")

          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true

          request = Net::HTTP::Post.new(uri.path, {
            "Content-Type" => "application/json",
            "api_key" => @config.api_key,
            "api_secret" => @config.api_secret
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

  if defined?(Rails::Application)
    class BugsifyEngine < Rails::Engine
      initializer "bugsify_engine.add_middleware" do |app|
        app.middleware.use Bugsify::RailsMiddleware
      end
    end
  end
end
