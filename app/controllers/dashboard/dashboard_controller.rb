class Dashboard::DashboardController < ApplicationController
  def index
  	if current_user.type == "JobSeeker"
	
		elsif current_user.type == "Recruiter"
			
		end
  end
end
