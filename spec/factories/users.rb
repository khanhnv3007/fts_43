FactoryGirl.define do
  sequence(:email){Faker::Internet.email}
  sequence(:chatwork_id){Faker::Lorem.words.join("_")}
  password = Faker::Lorem.characters 10

  factory :user do
    name Faker::Name.name
    email
    chatwork_id
    password password
    password_confirmation password
    role 0

    factory :admin do
      role 1
    end
  end
end
