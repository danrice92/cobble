FactoryBot.define do
  factory :user do
    name { Faker::Zelda.character }
    email { Faker::Internet.email }
  end
end
