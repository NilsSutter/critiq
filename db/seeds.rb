# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting Questions & Surveys"
Question.delete_all
Survey.delete_all

puts "Survey Create"
surv = Survey.new(title: "Test Survey A", description: "A Test Survey", channel_id: "CJPM6BA75", published: false, user_id: 1)
surv.save!
puts "Questions Create"
Question.create!(name: "Question 1", multiple_choice: false, question_type: "text", survey_id: surv.id)
Question.create!(name: "Question 2", multiple_choice: false, question_type: "text", survey_id: surv.id)

surv.update(published: true)
