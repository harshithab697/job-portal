class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :job_applications, :dashboard_job_id, :job_id
  end
end
