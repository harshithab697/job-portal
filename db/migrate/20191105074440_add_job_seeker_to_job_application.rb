class AddJobSeekerToJobApplication < ActiveRecord::Migration[6.0]
  def change
    add_reference :job_applications, :job_seeker, null: false, foreign_key: true
  end
end
