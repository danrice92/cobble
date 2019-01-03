FactoryBot.define do
  factory :job_experience, class: JobExperience do
    position { Faker::Job.title }
    company { Faker::Company.name }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    experience { "This job was horrible." }
    pay { "$15k/year or so." }
    recommendation { "Don't take this job." }
    website { Faker::Internet.url }
  end
end
