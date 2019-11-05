class AddDashboardJobToJobApplication < ActiveRecord::Migration[6.0]
  def change
    add_reference :job_applications, :dashboard_job, null: false, foreign_key: true
  end
end
