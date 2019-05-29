class SendSlackMessageJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ""
    puts "* Inside SendSlackMessageJob *"
    # Args: ARRAY of a HASH: Question_ID & Survey_ID

    # Console Test:
    # HTTParty.post("https://slack.com/api/chat.postMessage", body: {token: ENV["SLACK_API_TOKEN"], as_user: true, channel: "UK14YMUQY", text: "HTTParty Test"})
    #p "> #{args[:survey_id]}"

    puts "> Finding Survey with id #{args[0][:survey_id]}"
    survey = Survey.find(args[0][:survey_id])
    puts "> Finding Question with id #{args[0][:question_id]}"
    question_text = Question.find(args[0][:question_id]).name

    puts "> Fetching member list from SLACK API"
    member_list = HTTParty.get("https://slack.com/api/channels.info",
                    query: {
                      token: ENV["SLACK_API_TOKEN"],
                      channel: survey.channel_id })

    puts "> Beginning to iterate over member list..."
    member_list["channel"]["members"].each do |member_uid|
      # .reject { |x| x == current_user.uid }

      puts "> Sending message to #{member_uid}"
      HTTParty.post("https://slack.com/api/chat.postMessage",
        body: {
          token: ENV["SLACK_API_TOKEN"],
          as_user: true, # So it looks like the bot sent it
          channel: member_uid, # Opens DM with user
          text: question_text,
          })

    end
    puts "Finished sending all messages!"
  end
end
