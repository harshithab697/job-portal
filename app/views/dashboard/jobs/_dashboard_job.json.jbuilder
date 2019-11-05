json.extract! dashboard_job, :id, :title, :description, :salary, :experience, :job_location, :created_at, :updated_at
json.url dashboard_job_url(dashboard_job, format: :json)
