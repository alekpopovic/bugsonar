# frozen_string_literal: true

module Bugsonar
  module Reporter
    include Environment

    def report(event)
      Bugsonar.send(:auto_capture_exception, {
        errorClass: event[:error_class],
        errorBacktrace: event[:error_backtrace],
        errorFullBacktrace: event[:error_full_backtrace],
        runtimeVersion: event[:runtime_version],
        applicationEnvironment: fetch_environment,
      })
    end
  end
end
