# frozen_string_literal: true

module Codepop
  # Error
  module Notifier
    # rubocop:disable Metrics/MethodLength
    def auto_notify(args = {})
      params = {
        data: {
          errorClass: args[:errorClass],
          errorBacktrace: args[:errorBacktrace],
          errorFullBacktrace: args[:errorFullBacktrace],
          runtimeVersion: args[:runtimeVersion],
          applicationEnvironment: args[:applicationEnvironment]
        }
      }

      Codepop::Client::Api.new.request(
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
