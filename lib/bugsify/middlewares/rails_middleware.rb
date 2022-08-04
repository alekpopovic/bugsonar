# frozen_string_literal: true

if defined?(Rails::Application)

  require "rails/all"

  module Bugsify
    class RailsMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        request = ActionDispatch::Request.new env
        @app.call(env)
      rescue Exception => e
        trace = e.backtrace.select { |l| l.start_with?(Rails.root.to_s) }.join("\n    ")
        msg = "\n#{e.class}\n#{e.message}\n#{trace}"
        if request.show_exceptions?
          Bugsify.notify(msg)
          raise e
        else
          Bugsify.notify(msg)
          raise e
        end
      end
    end
  end

end