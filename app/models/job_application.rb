	class JobApplication < ApplicationRecord
	belongs_to :job, class_name: "Dashboard::Job"
	belongs_to :job_seeker
end
