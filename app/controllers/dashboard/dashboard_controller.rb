class Dashboard::DashboardController < ApplicationController
  def index
	 if current_user.instance_of?JobSeeker
	 	 @applied_job = [ ]
	 	 @all_jobs = [ ]
	 	 @jobs = JobApplication.where(job_seeker_id: current_user.id)
	 	 @jobs.each do |job|
	 	 		@applied_job << job.job_id
	 	 end
	 	 if @applied_job.empty?
	 	 		@all_jobs = Dashboard::Job.all
	 	 else
	 	 	  @applied_job.each do |apply|
	 	 		@all_jobs << Dashboard::Job.where.not(id: apply)
	 	    end
	 	  end
	 else
	 end
	end
end