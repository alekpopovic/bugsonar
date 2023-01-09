# frozen_string_literal: true

module Bugsify
  # Error
  module Notifier
    # rubocop:disable Metrics/MethodLength
    def auto_notify(args = {})
      params = {
        errorClass: args[:errorClass],
        errorBacktrace: args[:errorBacktrace],
        errorFullBacktrace: args[:errorFullBacktrace],
        runtimeVersion: args[:runtimeVersion],
        applicationEnvironment: args[:applicationEnvironment]
      }

      Bugsify::Client::Api.new.request(
        "collectors/ruby",
        "Post",
        params,
        &method(:parse)
      )
    end
    # rubocop:enable Metrics/MethodLength

    private

    def parse(response)
      puts response
    end
  end
end
