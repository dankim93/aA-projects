# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{user_name: "name1"}, {user_name: "name2"}, {user_name: "name3"}])
Poll.create(title: "coffee", author_id: 1)
Question.create({text: "what coffee do you like", poll_id: 1})
AnswerChoice.create(text: "black", question_id: 1)
Response.create(user_id: 1, answer_choice_id: 1)
