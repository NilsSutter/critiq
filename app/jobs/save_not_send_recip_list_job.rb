class SaveNotSendRecipListJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Fetching Member List from SLACK API for Chan: #{args[0][:channel_id]}"
    survey = Survey.find(args[0][:surv_id])
    ml = HTTParty.get("https://slack.com/api/channels.info",
          query: {
            token: ENV["SLACK_API_TOKEN"],
            channel: args[0][:channel_id] })

    ml["channel"]["members"].reject { |x| x == User.find(survey.user_id).uid }.each do |uid|
      GetSlackUserInfoJob.perform_later(uid: uid, surv_id: survey.id)
    end
  end
end
