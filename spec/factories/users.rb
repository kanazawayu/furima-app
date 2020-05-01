FactoryBot.define do

  factory :user do
    id                    {1}
    nickname              {"abe"}
    password              {"00000000"}
    sequence(:email) {Faker::Internet.email}
  end

  
end