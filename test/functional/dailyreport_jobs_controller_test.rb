require 'test_helper'

class DailyreportJobsControllerTest < ActionController::TestCase
  setup do
    @dailyreport_job = dailyreport_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailyreport_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailyreport_job" do
    assert_difference('DailyreportJob.count') do
      post :create, :dailyreport_job => @dailyreport_job.attributes
    end

    assert_redirected_to dailyreport_job_path(assigns(:dailyreport_job))
  end

  test "should show dailyreport_job" do
    get :show, :id => @dailyreport_job.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dailyreport_job.to_param
    assert_response :success
  end

  test "should update dailyreport_job" do
    put :update, :id => @dailyreport_job.to_param, :dailyreport_job => @dailyreport_job.attributes
    assert_redirected_to dailyreport_job_path(assigns(:dailyreport_job))
  end

  test "should destroy dailyreport_job" do
    assert_difference('DailyreportJob.count', -1) do
      delete :destroy, :id => @dailyreport_job.to_param
    end

    assert_redirected_to dailyreport_jobs_path
  end
end
