# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Bugsonar
  module Client
    class Api
      def request(method, body = nil)
        uri = URI.parse("https://api.bugsonar.com/v2/collectors/ruby")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        klass = "Net::HTTP::#{method}"
        constantized = Object.const_get(klass)

        request = constantized.new(uri)
        request["Content-Type"] = "application/json"
        request["X-Api-Key"] = Bugsonar.config.api_key
        request.body = { payload: body }.to_json if body

        http.request(request)
      end
    end
  end
end
