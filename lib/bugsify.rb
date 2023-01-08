# frozen_string_literal: true

require "uri"
require "net/http"
require "json"
require "bugsify/version"
require "bugsify/config"
require "bugsify/client"
require "bugsify/notifier"
require "bugsify/engines/bugsify"     if Gem.loaded_specs.key?("rails")
require "bugsify/middlewares/rails"   if Gem.loaded_specs.key?("rails")
require "bugsify/middlewares/sinatra" if Gem.loaded_specs.key?("sinatra")
require "bugsify/middlewares/padrino" if Gem.loaded_specs.key?("padrino")

# Bugsify
module Bugsify; end
