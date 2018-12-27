FactoryBot.define do
  factory :user, class: User do
    first_name { "Rusty" }
    last_name { "Shackleford" }
    email { "rusty@rustysshackles.com" }
  end
end
