require 'test_helper'

class Dashboard::JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dashboard_job = dashboard_jobs(:one)
  end

  test "should get index" do
    get dashboard_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_dashboard_job_url
    assert_response :success
  end

  test "should create dashboard_job" do
    assert_difference('Dashboard::Job.count') do
      post dashboard_jobs_url, params: { dashboard_job: { description: @dashboard_job.description, experience: @dashboard_job.experience, job_location: @dashboard_job.job_location, salary: @dashboard_job.salary, title: @dashboard_job.title } }
    end

    assert_redirected_to dashboard_job_url(Dashboard::Job.last)
  end

  test "should show dashboard_job" do
    get dashboard_job_url(@dashboard_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_dashboard_job_url(@dashboard_job)
    assert_response :success
  end

  test "should update dashboard_job" do
    patch dashboard_job_url(@dashboard_job), params: { dashboard_job: { description: @dashboard_job.description, experience: @dashboard_job.experience, job_location: @dashboard_job.job_location, salary: @dashboard_job.salary, title: @dashboard_job.title } }
    assert_redirected_to dashboard_job_url(@dashboard_job)
  end

  test "should destroy dashboard_job" do
    assert_difference('Dashboard::Job.count', -1) do
      delete dashboard_job_url(@dashboard_job)
    end

    assert_redirected_to dashboard_jobs_url
  end
end
