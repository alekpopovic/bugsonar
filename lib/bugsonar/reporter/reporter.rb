# frozen_string_literal: true

module Bugsonar
  # Rack
  module Reporter
    # @param [Object] event
    def report(event)
      Bugsonar.send(:auto_capture_exception, {
        errorClass: event[:error_class],
        errorBacktrace: event[:error_backtrace],
        errorFullBacktrace: event[:error_full_backtrace],
        runtimeVersion: event[:runtime_version],
        applicationEnvironment: ENV.fetch("RACK_ENV", nil),
      })
    end
  end
end
