# frozen_string_literal: true

require_relative "../notifier"

module Bugsify
  module Reporter
    # Rack
    module Rack
      include Notifier
      def notify(event)
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
end
