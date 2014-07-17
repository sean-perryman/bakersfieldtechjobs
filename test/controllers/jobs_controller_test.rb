require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs)
  end

  test "should show job" do
    get :show, id: @job
    assert_response :success
  end

  test "should create job if authorized" do
    sign_in users(:sean)
    assert_difference('Job.count') do
      post :create, job: jobs(:one)
    end

    assert_redirected_to job_path(assigns(:job))
  end

  test "should get edit if owned by the user" do
    sign_in users(:sean)
    post :edit, id: @job
    assert_response :success
  end

  test "should update job if owned by the user" do
    sign_in users(:sean)
    patch :update, id: @job, job: jobs(:one)
    assert_redirected_to job_path(assigns(:job))
  end

  test "should destroy job if owned by the user" do
    sign_in users(:sean)
    assert_difference('Job.count', -1) do
      delete :destroy, id: @job
    end

    assert_redirected_to jobs_path
  end
end