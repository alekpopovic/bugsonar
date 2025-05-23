# frozen_string_literal: true

module Bugsonar
  module Environment
    def fetch_environment
      ENV.fetch("RACK_ENV", "NO_ENV") if ENV.has_key?("RACK_ENV")
      ENV.fetch("RACK_ENV", "NO_ENV") if ENV.has_key?("RACK_ENV")
      ENV.fetch("APP_ENV", "NO_ENV") if ENV.has_key?("APP_ENV")
    end
  end
end
