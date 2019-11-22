class Dashboard::DashboardController < ApplicationController
  def index
  	if current_user.instance_of?JobSeeker
  		if params[:search] or params[:salary] or params[:experience] or params[:location] 
  			@jobs = Job.search(body: search_query.to_json).results
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

  private

  def search_query
    {
      query: {
        bool: {
          must: must_query,
          filter: filters
        }
      },
      size: 10000,
    }
  end

  def filters
    filters = []
    filters << { term: { salary: params[:salary] } } if params[:salary].present?
    filters << { term: { experience: params[:experience] } } if params[:experience].present?
    filters << { term: { job_location: params[:location] } } if params[:location].present?
    filters
  end

  def must_query
    must = []
    if params[:search].present?
      must << multi_match_query
    else
      must = [
        match_all: {}
      ]
    end
    must
  end

  def multi_match_query
    {
     wildcard: {
     	title: {
       value: params[:search]
     		}
   		}
    }
  end
end
