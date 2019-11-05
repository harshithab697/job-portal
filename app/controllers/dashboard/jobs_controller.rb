class Dashboard::JobsController < ApplicationController
  before_action :set_dashboard_job, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/jobs
  # GET /dashboard/jobs.json
  def index
    @dashboard_jobs = Dashboard::Job.all
  end

  # GET /dashboard/jobs/1
  # GET /dashboard/jobs/1.json
  def show
  end

  # GET /dashboard/jobs/new
  def new
    @dashboard_job = Dashboard::Job.new
  end

  # GET /dashboard/jobs/1/edit
  def edit
  end

  # POST /dashboard/jobs
  # POST /dashboard/jobs.json
  def create
    @dashboard_job = Dashboard::Job.new(dashboard_job_params)

    respond_to do |format|
      if @dashboard_job.save
        format.html { redirect_to @dashboard_job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard_job }
      else
        format.html { render :new }
        format.json { render json: @dashboard_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/jobs/1
  # PATCH/PUT /dashboard/jobs/1.json
  def update
    respond_to do |format|
      if @dashboard_job.update(dashboard_job_params)
        format.html { redirect_to @dashboard_job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard_job }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/jobs/1
  # DELETE /dashboard/jobs/1.json
  def destroy
    @dashboard_job.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_job
      @dashboard_job = Dashboard::Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_job_params
      params.require(:dashboard_job).permit(:title, :description, :salary, :experience, :job_location)
    end
end
