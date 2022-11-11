# frozen_string_literal: true

module Codepop
  module Reporter
    # Rack
    module Rack
      def notify(event)
        Codepop.auto_notify({
                              errorClass: event[:error_class],
                              errorBacktrace: event[:error_backtrace],
                              errorFullBacktrace: event[:error_full_backtrace],
                              runtimeVersion: event[:runtime_version],
                              applicationEnvironment: ENV.fetch("RACK_ENV", nil)
                            })
      end
    end
  end
end
