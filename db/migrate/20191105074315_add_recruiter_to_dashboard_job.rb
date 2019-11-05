class AddRecruiterToDashboardJob < ActiveRecord::Migration[6.0]
  def change
    add_reference :dashboard_jobs, :recruiter, null: false, foreign_key: true
  end
end
