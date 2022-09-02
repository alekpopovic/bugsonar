# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Bugsify
  module CustomNotifier
    include Config
  end
end