# frozen_string_literal: true

require "codepop/version"
require "codepop/config"
require "codepop/engines/codepop"     if Gem.loaded_specs.has_key?("rails")
require "codepop/middlewares/rails"   if Gem.loaded_specs.has_key?("rails")
require "codepop/middlewares/sinatra" if Gem.loaded_specs.has_key?("sinatra")
require "codepop/middlewares/padrino" if Gem.loaded_specs.has_key?("padrino")

# Bugsify
module Codepop
  include Config
end
