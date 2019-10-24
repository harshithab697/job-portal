class ApplicationController < ActionController::Base
	devise_group :user, contains: [:recruiter,:job_seeker]
end
