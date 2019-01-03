class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :job_experience
end
