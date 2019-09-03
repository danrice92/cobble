FactoryBot.define do
  factory :user do
    name { Faker::Games::Zelda.character }
    email { Faker::Internet.email }
  end
end
