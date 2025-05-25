# frozen_string_literal: true

module Bugsonar
  module Parser
    include Reporter

    def rails(e)
      trace = e.backtrace.select { |l| l.start_with?(Rack::Directory.new("").root) }.join("\n    ")
      payload = {
        error_class: e.class,
        error_backtrace: "\n#{e.class}\n#{e.message}\n#{trace}",
        error_full_backtrace: e.backtrace.select { |l| l }.join("\n    "),
        runtime_version: runtime_version,
      }
      report(payload)
      raise e
    end

    def rack(e)
      payload = {
        error_class: e.class,
        error_backtrace: e,
        error_full_backtrace: "\n#{e.class}\n#{e.message}\n#{e}",
        runtime_version: runtime_version,
      }
      report(payload)
      raise e
    end

    def manual(e)
      payload = {
        error_class: e.class,
        error_backtrace: e,
        runtime_version: runtime_version,
      }
      report(payload)
      raise e
    end

    private

    def runtime_version
      {
        ruby_version: RUBY_VERSION,
        ruby_release_date: RUBY_RELEASE_DATE,
        ruby_platform: RUBY_PLATFORM,
        load_path: $LOAD_PATH,
      }
    end
  end
end
