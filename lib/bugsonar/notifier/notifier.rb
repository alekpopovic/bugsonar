# frozen_string_literal: true

module Bugsonar
  module Notifier
    include Client
    include Parser

    def capture_exception(exception)
      raise "Argument #{exception} is not exception" unless exception.is_a?(Exception)

      manual(exception)
    end

    private

    def auto_capture_exception(args = {})
      params = {
        errorClass: args[:errorClass],
        errorBacktrace: args[:errorBacktrace],
        errorFullBacktrace: args[:errorFullBacktrace],
        runtimeVersion: args[:runtimeVersion],
        applicationEnvironment: args[:applicationEnvironment],
      }

      Api.new.request(
        "Post",
        params,
        &method(:parse)
      )
    end

    def parse(response)
      puts response
    end
  end
end
