# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting Questions, Surveys, Responses, Choices, SentQuestions"
Choice.delete_all
Response.delete_all
SentQuestion.delete_all
Question.delete_all
Survey.delete_all


# START surveys
# Arr with survey-titles and descriptions
titl = ["Weekly", "Prototype Presentation", "Financial Statement Presentation", "Landingpage", "Laser-Inferno", "Third Iteration on navbar", "Rich's Presentation-Practice for Demo Day"]
descr = ["Feedback for weekly presentation", "Hey Guys, please leave feedback on the first landingpage-draft", "change navbar border-radius && linear-gradient", "feedback needed until tomorrow, please hurry."]

# Create 10 random surveys
puts "Create Surveys"
10.times do
  surv = Survey.new(title: titl.sample, description: descr.sample, channel_id: "CJPM6BA75", published: true, user_id: 1)
  surv.save!
end
# END surveys


# START Questions
# Arr with random questions, 5 for each question_type: open text & radio
open_text = ["What did you like most?", "What did you dislike the most?", "If you had the opportunity, what would you change about the page?", "How should the perfect presentation/prototype be like?"]
mult_choice = ["On a scale from 1-10, how strongly would you recommend this to friends?", "How old are you?", "Gender:", "From not much(1) to very much(5), how happy does this prototype make you?"]

# create questions
puts "Create Questions"
15.times do
  quest = Question.new(name: open_text.sample, multiple_choice: false, question_type: "text", survey_id: rand(1..10))
  quest.save!
end

15.times do
  quest = Question.new(name: mult_choice.sample, multiple_choice: true, question_type: "radio", survey_id: rand(1..10))
  quest.save!
end
# END questions

# surv = Survey.new(title: "Test Survey A", description: "A Test Survey", channel_id: "CJPM6BA75", published: false, user_id: 1)
# surv.save!
# puts "Questions Create"
# Question.create!(name: "Question 1?", multiple_choice: false, question_type: "text", survey_id: surv.id)
# Question.create!(name: "Question 2?", multiple_choice: false, question_type: "text", survey_id: surv.id)
# Question.create!(name: "Question 3?", multiple_choice: false, question_type: "text", survey_id: surv.id)

# surv.update(published: true)


puts "Regular Survey Create"
surv = Survey.new(title: "Test Survey A", description: "A Test Survey", channel_id: "CJPM6BA75", published: false, user_id: 1)
surv.save!
puts "Regular Questions Create"
Question.create!(name: "Question 1?", multiple_choice: false, question_type: "text", survey_id: surv.id)
Question.create!(name: "Question 2?", multiple_choice: false, question_type: "text", survey_id: surv.id)
Question.create!(name: "Question 3?", multiple_choice: false, question_type: "text", survey_id: surv.id)

# surv.update(published: true)

puts "MC Survey Create"
surv_mc = Survey.new(title: "Test Survey B", description: "A Test Survey with Multi Choice Questions", channel_id: "CJPM6BA75", published: false, user_id: 1)
surv_mc.save!
puts "MC Questions Create"

mc_1 = Question.new(name: "Question 1 MC?", multiple_choice: true, question_type: "text", survey_id: surv_mc.id)
mc_1.save!
        Choice.create(name: "Pick me A", question_id: mc_1.id)
        Choice.create(name: "Pick me B", question_id: mc_1.id)
        Choice.create(name: "Pick me C", question_id: mc_1.id)
        Choice.create(name: "Pick me D", question_id: mc_1.id)

mc_2 = Question.new(name: "Question 2 MC?", multiple_choice: true, question_type: "text", survey_id: surv_mc.id)
mc_2.save!
        Choice.create(name: "Pick me A", question_id: mc_2.id)
        Choice.create(name: "Pick me B", question_id: mc_2.id)
        Choice.create(name: "Pick me C", question_id: mc_2.id)
        Choice.create(name: "Pick me D", question_id: mc_2.id)

mc_3 = Question.new(name: "Question 3 MC?", multiple_choice: true, question_type: "text", survey_id: surv_mc.id)
mc_3.save!
        Choice.create(name: "Pick me A", question_id: mc_3.id)
        Choice.create(name: "Pick me B", question_id: mc_3.id)
        Choice.create(name: "Pick me C", question_id: mc_3.id)
        Choice.create(name: "Pick me D", question_id: mc_3.id)

# surv_mc.update(published: true)

