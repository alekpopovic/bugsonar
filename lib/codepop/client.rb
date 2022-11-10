# frozen_string_literal: true

module Codepop
  # Client
  module Client
    # Api
    class Api
      def request(uri, method, body = nil)
        http = Net::HTTP.new(Config.api(uri).host, Config.api(uri).port)
        http.use_ssl = Config.use_ssl

        case method
        when "POST"
          request = Net::HTTP::Post.new(uri)
        when "PUT"
          request = Net::HTTP::Put.new(uri)
        when "DELETE"
          request = Net::HTTP::Delete.new(uri)
        when "PATCH"
          request = Net::HTTP::Patch.new(uri)
        when "GET"
          request = Net::HTTP::Get.new(uri)
        else
          raise Error, Codepop::Error::API_METHOD_ERROR
        end

        request["Content-Type"] = "application/json"
        request["Api-Key"] = Codepop.config.api_key

        request.body = body.to_json if body

        response = http.request(request)

        obj = JSON.parse(response.read_body)

        yield(obj) if block_given?
      end
    end
  end
end
