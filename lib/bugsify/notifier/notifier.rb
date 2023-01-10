# frozen_string_literal: true

module Bugsify
  # Error
  module Notifier
    include Client
    include Parser

    def capture_exception(exception)
      raise "Argument #{exception} is not exception" unless exception.is_a?(Exception)

      custom_error(exception)
    end

    private

    # rubocop:disable Metrics/MethodLength
    def auto_capture_exception(args = {})
      params = {
        errorClass: args[:errorClass],
        errorBacktrace: args[:errorBacktrace],
        errorFullBacktrace: args[:errorFullBacktrace],
        runtimeVersion: args[:runtimeVersion],
        applicationEnvironment: args[:applicationEnvironment]
      }

      Api.new.request(
        "collectors/ruby",
        "Post",
        params,
        &method(:parse)
      )
    end
    # rubocop:enable Metrics/MethodLength

    def parse(response)
      puts response
    end
  end
end
