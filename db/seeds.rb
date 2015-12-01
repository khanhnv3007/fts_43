Subject.create!(name: "Ruby on rails")

Subject.create!(name: "Git")

Subject.create!(name: "Ruby")

30.times do |n|
  name = Faker::Lorem.sentence
  question_type = 0
  if n%2 == 0
    question_type = 1
  end
  question = Question.create!(content: name, subject_id: 1, user_id: 1, question_type: question_type, status: 1)
  question_id = question.id
  answer_correct = Faker::Lorem.word
  Answer.create!(content: answer_correct, is_correct: true, question_id: question_id)
  3.times do |t|
    answer_incorrect = Faker::Lorem.word
    Answer.create!(content: answer_incorrect, is_correct: false, question_id: question_id)
  end
end

10.times do |n|
  name = Faker::Lorem.sentence
  question = Question.create!(content: name, subject_id: 1, user_id: 1, question_type: 2)
  question_id = question.id
  answer_correct = Faker::Lorem.word
  Answer.create!(content: answer_correct, is_correct: true, question_id: question_id)
end

User.create!(
  name: "Admin",
  email: "admin@framgia.com",
  password: "12345678",
  password_confirmation: "12345678",
  role: 1)
