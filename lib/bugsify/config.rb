module Bugsify
  class Config
    include Singleton

    attr_accessor :application_uid, :application_secret

    def setup
      yield self if block_given?
    end
  end
end