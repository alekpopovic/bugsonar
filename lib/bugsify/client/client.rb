# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Bugsify
  # Client
  module Client
    # Api
    class Api
      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def request(uri, method, body = nil)
        uri = URI.parse("http://localhost:3001/v1/#{uri}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = false

        klass = "Net::HTTP::#{method}"
        constantized = Object.const_get(klass)

        request = constantized.new(uri)
        request["Content-Type"] = "application/json"
        request["Api-Key"] = Bugsify.config.api_key
        request.body = { data: body }.to_json if body

        response = http.request(request)

        obj = JSON.pretty_generate(
          JSON.parse(response.read_body)
        )

        yield(obj) if block_given?
      end
      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Metrics/MethodLength
    end
  end
end
