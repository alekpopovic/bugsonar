# frozen_string_literal: true

module Bugsify
  module Reporter
    # Rails
    module Rails
      # rubocop:disable Metrics/MethodLength
      def notify(event)
        semaphore = Thread::Mutex.new

        Thread.new do
          semaphore.synchronize do
            Bugsify.auto_notify({
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
