class CreateJobSeekers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_seekers do |t|

      t.timestamps
    end
  end
end
