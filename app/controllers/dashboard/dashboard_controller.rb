class Dashboard::DashboardController < ApplicationController
  def index
  	if current_user.instance_of?JobSeeker
  		if params[:search]
  			@jobs = Job.where("title LIKE ?","%#{params[:search]}%")
  			return @jobs
  		end
			@applied_job = [ ]
			@all_jobs = Job.pluck(:id)
			jobs = JobApplication.where(job_seeker_id: current_user.id)
			jobs.each do |job|
				@applied_job << job.job_id
			end
			if @applied_job.empty?
				return @all_jobs
			else
				# @applied_job.each do |apply|
				# 	@all_jobs << Job.where.not(id: apply)
				# end
				@all_jobs -= @applied_job
				return @all_jobs
			end
		else
			if params[:search]
				@jobs = Job.where("title LIKE ?","%#{params[:search]}%")
			else
				@jobs = Job.where(recruiter_id: current_recruiter.id)
		  end
		end
  end
end
