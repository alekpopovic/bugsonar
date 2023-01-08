# frozen_string_literal: true

require_relative "../notifier"

module Bugsify
  module Reporter
    # Rails
    module Rails
      include Notifier

      # rubocop:disable Metrics/MethodLength
      def notify(event)
        semaphore = Thread::Mutex.new

        Thread.new do
          semaphore.synchronize do
            auto_notify({
                                  errorClass: event[:error_class],
                                  errorBacktrace: event[:error_backtrace],
                                  errorFullBacktrace: event[:error_full_backtrace],
                                  runtimeVersion: event[:runtime_version],
                                  applicationEnvironment: ENV["RACK_ENV"]
                                })
          end
        end
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
