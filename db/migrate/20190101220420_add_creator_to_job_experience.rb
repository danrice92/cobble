class AddCreatorToJobExperience < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_experiences, :creator, index: true
    add_foreign_key :job_experiences, :users, column: :creator_id
  end
end
