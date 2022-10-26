# frozen_string_literal: true

require "cdp/version"
require "cdp/config"
require "cdp/engines/cdp"         if Gem.loaded_specs.has_key?("rails")
require "cdp/middlewares/rails"   if Gem.loaded_specs.has_key?("rails")
require "cdp/middlewares/sinatra" if Gem.loaded_specs.has_key?("sinatra")
require "cdp/middlewares/padrino" if Gem.loaded_specs.has_key?("padrino")

# Bugsify
module Cdp
  include Config

  class Notifier; end
end
