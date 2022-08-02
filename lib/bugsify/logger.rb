require_relative "./notifier"

module Bugsify
  class Logger
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue NoMemoryError,
      ScriptError,
      LoadError,
      NotImplementedError,
      SyntaxError,
      SignalException,
      Interrupt,
      StandardError,
      ArgumentError,
      IOError,
      EOFError,
      IndexError,
      LocalJumpError,
      NameError,
      NoMethodError,
      RangeError,
      FloatDomainError,
      RegexpError,
      RuntimeError,
      SecurityError,
      SystemCallError,
      SystemStackError,
      ThreadError,
      TypeError,
      ZeroDivisionError => e
      trace = e.backtrace.select { |l| l.start_with?(Rails.root.to_s) }.join("\n    ")
      msg = "\n#{e.class}\n#{e.message}\n#{trace}"
      Bugsify.notify({
        error: msg
      })
      raise e
    end
  end
end