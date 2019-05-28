class SlackController < ApplicationController
  def home
    @survey = Survey.all.first
  end
  def send_survey
    # Console Test:
    # HTTParty.post("https://slack.com/api/chat.postMessage", body: {token: ENV["SLACK_API_TOKEN"], as_user: true, channel: "UK14YMUQY", text: "HTTParty Test"})

    survey = Survey.all.first
    question_text = "Dummy Text"

    member_list = HTTParty.get("https://slack.com/api/channels.info",
                    query: {
                      token: ENV["SLACK_API_TOKEN"],
                      channel: survey.channel_id })

    member_list["channel"]["members"].each do |member_uid|
      # .reject { |x| x == current_user.uid }


      HTTParty.post("https://slack.com/api/chat.postMessage",
        body: {
          token: ENV["SLACK_API_TOKEN"],
          as_user: true, # So it looks like the bot sent it
          channel: member_uid, # Opens DM with user
          text: question_text,
          })

    end
  end

  private

  def which_question_next
    survey = Survey.all.first
    questions = survey.questions

    

  end
end
