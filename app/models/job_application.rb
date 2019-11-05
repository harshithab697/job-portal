class JobApplication < ApplicationRecord
	belongs_to :recruiter
	belongs_to :job_seeker
end
