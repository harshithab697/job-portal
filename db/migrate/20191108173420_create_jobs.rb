class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :salary
      t.string :experience
      t.string :job_location
      
      t.timestamps
    end
  end
end
