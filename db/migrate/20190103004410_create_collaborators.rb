class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.belongs_to :user, index: true
      t.belongs_to :job_experience, index: true
      t.timestamps
    end
  end
end
