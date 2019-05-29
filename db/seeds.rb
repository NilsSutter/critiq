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

puts "Regular Survey Create"
surv = Survey.new(title: "Test Survey A", description: "A Test Survey", channel_id: "CJPM6BA75", published: false, user_id: 1)
surv.save!
puts "Regular Questions Create"
Question.create!(name: "Question 1?", multiple_choice: false, question_type: "text", survey_id: surv.id)
Question.create!(name: "Question 2?", multiple_choice: false, question_type: "text", survey_id: surv.id)
Question.create!(name: "Question 3?", multiple_choice: false, question_type: "text", survey_id: surv.id)

surv.update(published: true)

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
