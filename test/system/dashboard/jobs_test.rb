require "application_system_test_case"

class Dashboard::JobsTest < ApplicationSystemTestCase
  setup do
    @dashboard_job = dashboard_jobs(:one)
  end

  test "visiting the index" do
    visit dashboard_jobs_url
    assert_selector "h1", text: "Dashboard/Jobs"
  end

  test "creating a Job" do
    visit dashboard_jobs_url
    click_on "New Dashboard/Job"

    fill_in "Description", with: @dashboard_job.description
    fill_in "Experience", with: @dashboard_job.experience
    fill_in "Job location", with: @dashboard_job.job_location
    fill_in "Salary", with: @dashboard_job.salary
    fill_in "Title", with: @dashboard_job.title
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit dashboard_jobs_url
    click_on "Edit", match: :first

    fill_in "Description", with: @dashboard_job.description
    fill_in "Experience", with: @dashboard_job.experience
    fill_in "Job location", with: @dashboard_job.job_location
    fill_in "Salary", with: @dashboard_job.salary
    fill_in "Title", with: @dashboard_job.title
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit dashboard_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
