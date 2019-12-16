class Dashboard::DashboardController < ApplicationController
  def index
    @job_locations = Job.pluck(:job_location).uniq
    @job = Job.new
		if params[:search] or params[:salary] or params[:experience] or params[:location]
			@jobs = Job.search(body: search_query.to_json).results
      @recruiter_jobs = Job.where(recruiter_id: current_user.id).where("title LIKE ?","%#{params[:search]}%")
    else
      @applied_jobs = Job.joins(:job_seekers).map{|job| job if job.job_seekers.ids.include?(current_user.id)}.uniq
      @all_jobs = Job.all.to_a - @applied_jobs
      @recruiter_jobs = Job.where(recruiter_id: current_user.id)
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
    filters << { range: { salary: {lte: params[:salary]} } } if params[:salary].present?
    filters << { range: { experience: {lte: params[:experience]} } } if params[:experience].present?
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
       value: "*#{params[:search]}*"
     		}
   		}
    }
  end
end
