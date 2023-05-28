# frozen_string_literal: true

require "bugsify/config/config"
require "bugsify/client/client"
require "bugsify/reporter/reporter"
require "bugsify/parser/parser"
require "bugsify/middleware/middleware"
require "bugsify/notifier/notifier"
require "bugsify/engine/bugsify"

module Bugsify
  include Config
  include Client
  include Reporter
  include Parser
  extend Notifier
end
