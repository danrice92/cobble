class RemoveOldTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :job_experiences
    drop_table :collaborators
  end
end
