# frozen_string_literal: true

require_relative "./client"

module Bugsify
  # Error
  module Notifier
    include Client
    # rubocop:disable Metrics/MethodLength
    def auto_notify(args = {})
      params = {
        errorClass: args[:errorClass],
        errorBacktrace: args[:errorBacktrace],
        errorFullBacktrace: args[:errorFullBacktrace],
        runtimeVersion: args[:runtimeVersion],
        applicationEnvironment: args[:applicationEnvironment]
      }

      Api.new.request(
        "collectors/ruby",
        "POST",
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
