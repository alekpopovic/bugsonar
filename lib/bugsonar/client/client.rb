# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Bugsonar
  module Client
    class Api
      def request(endpoint, method, body = nil)
        uri = URI.parse("http://localhost:3001/v1/#{endpoint}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = false

        klass = "Net::HTTP::#{method}"
        constantized = Object.const_get(klass)

        request = constantized.new(uri)
        request["Content-Type"] = "application/json"
        request["apikey"] = Bugsonar.config.api_key
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
