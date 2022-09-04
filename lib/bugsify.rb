# frozen_string_literal: true

require "bugsify/version"
require "bugsify/config"
require "bugsify/middlewares/rails_middleware" if Gem.loaded_specs.has_key?("rails")
require "bugsify/middlewares/sinatra_middleware" if Gem.loaded_specs.has_key?("sinatra")
require "bugsify/middlewares/padrino_middleware" if Gem.loaded_specs.has_key?("padrino")

module Bugsify
  include Config
end
