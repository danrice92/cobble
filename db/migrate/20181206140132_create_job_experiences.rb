class CreateJobExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :job_experiences do |t|
      t.string :position
      t.string :company
      t.string :city
      t.string :state
      t.text :experience
      t.text :pay
      t.text :recommendation
      t.string :website

      t.timestamps
    end
  end
end
