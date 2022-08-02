#require_relative './constants'

#module Bugsify
#  module Notifier
#    extend self

#    def notify(data = {})
#      HTTParty.post(
#        Bugsify::Constants::API_COLLECTOR_ENDPOINT,
#        headers: {
#          Bugsify::Constants::API_APPLICATION_UID_KEY => Bugsify.new.application_uid,
#          Bugsify::Constants::API_APPLICATION_SECRET_KEY => Bugsify.new.application_secret,
#        },
#        body: {
#          data: data,
#          app_env: Rails.env
#        }
#      )
#    end
#  end
#end
