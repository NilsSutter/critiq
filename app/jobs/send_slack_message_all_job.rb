class SendSlackMessageAllJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ""
    puts "* Sending in 5s..."
    sleep(5)
    puts "* Inside SendSlackMessageAllJob *"
    # Args: ARRAY of a HASH: Question_ID & Survey_ID

    # Console Test:
    # HTTParty.post("https://slack.com/api/chat.postMessage", body: {token: ENV["SLACK_API_TOKEN"], as_user: true, channel: "UK14YMUQY", text: "HTTParty Test"})
    #p "> #{args[:survey_id]}"

    puts "> Finding Survey with id #{args[0][:survey_id]}"
    survey = Survey.find(args[0][:survey_id])
    puts "> Finding Question with id #{args[0][:question_id]}"
    question = Question.find(args[0][:question_id])

    puts "> Fetching member list from SLACK API"
    member_list = HTTParty.get("https://slack.com/api/channels.info",
                    query: {
                      token: ENV["SLACK_API_TOKEN"],
                      channel: survey.channel_id })


    sender = "#{User.find(survey.user_id).first_name.capitalize} #{User.find(survey.user_id).last_name.capitalize}"
    others = member_list["channel"]["members"].count - 1
    message_text = "Hi! #{sender} wants a Critiq. #{others} other people have been messaged and everyones responses will be anonymized. Here's the first question:\n"

    puts "> Beginning to iterate over member list..."
    member_list["channel"]["members"].each do |member_uid|
      # Put this in the above line before '.each' to prevent critiq's from being sent to their creator
      # .reject { |x| x == User.find(survey.user_id).uid }

      send_message(member_uid, message_text)

      if question.question_type == 'radio'
        puts "> Question is MC"
        send_message_multiple_choice(member_uid, question)
      else
        puts "> Question is NOT MC"
        send_message(member_uid, question.name)
      end

      puts ">> Creating SentQuestion entry for Question: #{args[0][:question_id]}, User: #{member_uid}"
      SentQuestion.create!(question_id: args[0][:question_id], recipent_slack_uid: member_uid)

    end
    puts "Finished sending all messages!"

  end

  private

  def send_message(target_uid, text)
    puts "> Sending regular message to #{target_uid}"
    HTTParty.post("https://slack.com/api/chat.postMessage",
      body: {
        token: ENV["SLACK_API_TOKEN"],
        as_user: true, # So it looks like the bot sent it
        channel: target_uid, # Opens DM with user
        text: text,
        })
  end

  def send_message_multiple_choice(target_uid, question)
    puts "> Sending MC message to #{target_uid}"
    question_text = "#{question.name}\n(Please respond with the number of your choice)"
    send_message(target_uid, question_text)

    question.choices.each_with_index do |choice, index|
      puts "> Sending Choice no.#{index + 1}: '#{choice.name}'"
      choice_text = "#{index + 1}: #{choice.name}"
      send_message(target_uid, choice_text)
    end
  end
end
