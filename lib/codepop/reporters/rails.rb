# frozen_string_literal: true

module Codepop
  module Reporter
    # Rails
    module Rails
      def notify(event)
        semaphore = Thread::Mutex.new

        Thread.new do
          semaphore.synchronize do
            Codepop.auto_notify({
                                  errorClass: event[:error_class],
                                  errorBacktrace: event[:error_backtrace],
                                  errorFullBacktrace: event[:error_full_backtrace],
                                  runtimeVersion: event[:runtime_version],
                                  applicationEnvironment: ENV["RACK_ENV"]
                                })
          end
        end
      end
    end
  end
end
