# frozen_string_literal: true

require "uri"
require "net/http"
require "json"
require "bugsify/version"
require "bugsify/config"
require "bugsify/middlewares/rails_middleware" if defined?(Rails::Application)
require "bugsify/middlewares/sinatra_middleware" if Gem.loaded_specs.has_key?("sinatra")
require "bugsify/middlewares/padrino_middleware"

module Bugsify
  
end
