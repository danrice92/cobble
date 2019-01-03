FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Zelda.character }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end
