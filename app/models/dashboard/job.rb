class Dashboard::Job < ApplicationRecord
	belongs_to :recruiter
	has_many :job_applications 
	has_many :job_seekers, through: :job_applications
end
