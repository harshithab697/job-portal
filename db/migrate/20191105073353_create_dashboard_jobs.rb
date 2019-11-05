class CreateDashboardJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :dashboard_jobs do |t|
      t.string :title
      t.text :description
      t.integer :salary
      t.integer :experience
      t.string :job_location

      t.timestamps
    end
  end
end
