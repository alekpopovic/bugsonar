require_relative './constants'

module Bugsify
  module Notifier
    def notify(data = {})
      # p Bugsify.application_uid
      HTTParty.post(
        Bugsify::Constants::API_COLLECTOR_ENDPOINT,
        headers: {
          Bugsify::Constants::API_APPLICATION_UID_KEY => Bugsify.application_uid,
          Bugsify::Constants::API_APPLICATION_SECRET_KEY => Bugsify.application_secret,
        },
        body: {
          data: data,
          app_env: Rails.env
        }
      )
    end
  end
end

#p Bugsify.application_uid
