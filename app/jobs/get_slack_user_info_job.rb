class GetSlackUserInfoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Fetching recipient INFO from SLACK API for #{args[0][:uid]}"
    info = HTTParty.get("https://slack.com/api/users.info",
                        query: {
                          token: ENV["SLACK_API_TOKEN"],
                          user: args[0][:uid]
                        })
    if info["ok"] == true
      Recipient.create(survey_id: args[0][:surv_id], uid: args[0][:uid], first_name: info["user"]["real_name"].split(" ")[0], last_name: info["user"]["real_name"].split(" ")[1])
    end
  end

end
