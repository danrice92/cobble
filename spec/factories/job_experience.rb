FactoryBot.define do
  factory :job_experience, class: JobExperience do
    position { "Cashier" }
    company { "Target" }
    city { "Fort Collins" }
    state { "CO" }
    experience { "This job was horrible." }
    pay { "$15k/year optimistically." }
    recommendation { "Don't take this job." }
    website { "www.target.com" }
  end
end
