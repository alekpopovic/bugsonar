# frozen_string_literal: true

# Development Environment:

# This is where developers work, writing and testing code,
# often using their local machines or a shared development environment.
# It's a controlled space where developers can make changes without affecting
# other parts of the system.

# Testing/QA Environment:

# This environment is dedicated to rigorously testing the software to ensure
# it meets requirements and functions correctly. Testers perform various tests, including unit,
# integration, and regression testing, to identify and fix bugs before deployment.

# Staging Environment:

# This environment is designed to closely resemble the production environment.
# It's used for final testing, including user acceptance testing (UAT),
# and ensures that the software behaves as expected under real-world conditions
# before it's released to production.

# Production Environment:

# This is the live environment where end-users interact with the software.
# It's the most stable and secure environment, and deployments are carefully planned to
# minimize downtime.

module Bugsonar
  module Environment
    def fetch_environment
      ENV.fetch("RACK_ENV", "NO_ENV") if ENV.has_key?("RACK_ENV")
      ENV.fetch("RACK_ENV", "NO_ENV") if ENV.has_key?("RACK_ENV")
      ENV.fetch("APP_ENV", "NO_ENV") if ENV.has_key?("APP_ENV")
    end
  end
end
