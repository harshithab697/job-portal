class Dashboard::DashboardController < ApplicationController
  def index
  	if current_user.instance_of?JobSeeker
			
		else
			@jobs = Dashboard::Job.where(recruiter_id: current_user.id)
		end
  end
end
