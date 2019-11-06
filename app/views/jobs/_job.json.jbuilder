json.extract! job, :id, :title, :description, :experience, :job_location, :created_at, :updated_at
json.url job_url(job, format: :json)
