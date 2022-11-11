# frozen_string_literal: true

module Codepop
  # Client
  module Client
    # Api
    class Api
      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def request(uri, method, body = nil)
        uri = URI.parse("https://api.codepop.co.rs/v1/#{uri}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = false
        case method
        when "POST"
          request = Net::HTTP::Post.new(uri)
        else
          raise Error, Codepop::Error::API_METHOD_ERROR
        end
        request["Content-Type"] = "application/json"
        request["Api-Key"] = Codepop.config.api_key
        request.body = { data: body }.to_json if body
        response = http.request(request)
        obj = JSON.parse(response.read_body)
        yield(obj) if block_given?
      end
      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Metrics/MethodLength
    end
  end
end
