class SendSlackMessageIndividualJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts ""
    puts "* Inside SendSlackMessageIndividual *"
    # Args: ARRAY of a HASH: Question_ID & target UID


    puts "> Finding Question with id #{args[0][:question_id]}"
    next_question = find_next_question(args[0][:question_id], args[0][:uid])

    if next_question == nil
      question_text = "Thats all, thanks!"
    else
      question_text = next_question.name
    end

    target_uid = args[0][:uid]

    puts "> Sending message to #{target_uid}"
    HTTParty.post("https://slack.com/api/chat.postMessage",
      body: {
        token: ENV["SLACK_API_TOKEN"],
        as_user: true, # So it looks like the bot sent it
        channel: target_uid, # Opens DM with user
        text: question_text,
        })

    unless next_question == nil
      puts ">> Creating SentQuestion entry for Question: #{args[0][:question_id]}, User: #{target_uid}"
      SentQuestion.create!(question_id: next_question.id, recipent_slack_uid: target_uid)
    end


    puts "Finished sending message to #{target_uid}!"

  end

  private

  def find_next_question(question_id, uid)
    # Array of all questions in same survey
    associated_questions = Question.find(question_id).survey.questions

    question_index = associated_questions.index { |x| x.id == question_id }

    last_question_sent = SentQuestion.where(recipent_slack_uid: uid).last.question_id

    if last_question_sent == associated_questions.last.id
      return nil
    else
      return associated_questions[question_index + 1]
    end
  end
end
