# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Bugsify
  module Notifier
    module Custom
      include Config
    end
  end
end
