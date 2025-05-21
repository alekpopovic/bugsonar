# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Bugsonar
  module Client
    class Api
      def request(method, body = nil)
        api_url = ENV.has_key?("RAILS_ENV") && ENV["RAILS_ENV"] == "development" ? "http://localhost:3000" : "https://api.bugsonar.com"

        uri = URI.parse("#{api_url}/v2/collectors/ruby")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = ENV.has_key?("RAILS_ENV") && ENV["RAILS_ENV"] == "production"

        klass = "Net::HTTP::#{method}"
        constantized = Object.const_get(klass)

        request = constantized.new(uri)
        request["Content-Type"] = "application/json"
        request["X-Api-Key"] = Bugsonar.config.api_key
        request.body = { payload: body }.to_json if body

        response = http.request(request)

        obj = JSON.pretty_generate(
          JSON.parse(response.read_body),
        )

        yield(obj) if block_given?
      end
    end
  end
end
