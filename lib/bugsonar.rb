# frozen_string_literal: true

require "bugsonar/config/config"
require "bugsonar/client/client"
require "bugsonar/reporter/reporter"
require "bugsonar/parser/parser"
require "bugsonar/middleware/middleware"
require "bugsonar/notifier/notifier"
require "bugsonar/engine/bugsonar"

module Bugsonar
  include Config
  include Client
  include Reporter
  include Parser
  extend Notifier
end
