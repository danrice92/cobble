class AddUserJobExperienceAssociation < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :job_experiences, index: true
    add_reference :job_experiences, :creator, index: true
    add_foreign_key :job_experiences, :users, column: :creator_id
    add_reference :job_experiences, :users, index: true
  end
end
