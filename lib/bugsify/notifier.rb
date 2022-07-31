module Bugsify
  class Notifier
    include Singleton

    def notify(data = {})
      HTTParty.post(
        "https://api.bugsify.io/v1/events/collector",
        headers: {
          "application_uid" => Bugsify::Config.instance.application_uid,
          "application_secret" => Bugsify::Config.instance.application_secret,
        },
        body: {
          data: data,
          app_env: Rails.env
        }
      )
    end
  end
end
