class AddColumnsToJobSeeker < ActiveRecord::Migration[6.0]
  def change
    add_column :job_seekers, :name, :string
    add_column :job_seekers, :qualification, :string
    add_column :job_seekers, :skills, :text
    add_column :job_seekers, :dob, :date
    add_column :job_seekers, :experience, :integer
  end
end
