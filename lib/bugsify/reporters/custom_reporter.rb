# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Bugsify
  module Reporter
    module Custom
      include Config
    end
  end
end
