# frozen_string_literal: true

require "debug"

module Bugsify
  # Rails
  module Parser
    include Reporter

    def rails_framework(e)
      trace = e.backtrace.select { |l| l.start_with?(Rack::Directory.new("").root) }.join("\n    ")
      payload = {
        error_class: e.class,
        error_backtrace: "\n#{e.class}\n#{e.message}\n#{trace}",
        error_full_backtrace: e.backtrace.select { |l| l }.join("\n    "),
        runtime_version: runtime_version("rails")
      }
      report(payload)
      raise e
    end

    def padrino_framework(e)
      payload = {
        error_class: e.class,
        error_backtrace: e,
        error_full_backtrace: "\n#{e.class}\n#{e.message}\n#{e}",
        runtime_version: runtime_version("padrino")
      }
      report(payload)
      raise e
    end

    def sinatra_framework(e)
      payload = {
        error_class: e.class,
        error_backtrace: e,
        error_full_backtrace: "\n#{e.class}\n#{e.message}\n#{e}",
        runtime_version: runtime_version("sinatra")
      }
      report(payload)
      raise e
    end

    def custom_error(e)
      # debugger
      payload = {
        error_class: e.class,
        error_backtrace: e,
        runtime_version: {
          ruby: RUBY_VERSION
        }
      }
      report(payload)
      raise e
    end

    private

    def runtime_version(framework)
      {
        "#{framework}": (Gem.loaded_specs[framework.to_s].version ? Gem.loaded_specs.key?(framework.to_s) : "No data"),
        rake: (Gem.loaded_specs["rake"].version ? Gem.loaded_specs.key?("rake") : "No data"),
        ruby: RUBY_VERSION
      }
    rescue NoMethodError

    end
  end
end
