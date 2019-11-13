class Dashboard::DashboardController < ApplicationController
  def index
  	if current_user.instance_of?JobSeeker
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
		end
  end
end
