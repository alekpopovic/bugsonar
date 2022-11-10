# frozen_string_literal: true

require "net/http"
require "json"
require "codepop/version"
require "codepop/config"
require "codepop/error"
require "codepop/client"
require "codepop/notifier"
require "codepop/engines/codepop"     if Gem.loaded_specs.key?("rails")
require "codepop/middlewares/rails"   if Gem.loaded_specs.key?("rails")
require "codepop/middlewares/sinatra" if Gem.loaded_specs.key?("sinatra")
require "codepop/middlewares/padrino" if Gem.loaded_specs.key?("padrino")

# Bugsify
module Codepop
  include Config
  include Error
  include Client
  extend Notifier
end
