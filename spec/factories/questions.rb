FactoryGirl.define do
  factory :question do
    subject {FactoryGirl.create :subject}
    user {FactoryGirl.create :user}
    content Faker::Lorem.sentence
  end

end
