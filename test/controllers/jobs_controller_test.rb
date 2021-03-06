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

  test "should create job if admin" do
    sign_in users(:admin)
    assert_difference('Job.count') do
      post :create, job: jobs(:one).attributes
    end

    assert_redirected_to job_path(assigns(:job))
  end

  test "should get edit if admin" do
    sign_in users(:admin)
    post :edit, id: @job
    assert_response :success
  end

  test "should update job if admin" do
    sign_in users(:admin)
    patch :update, id: @job, job: jobs(:one).attributes
    assert_redirected_to job_path(assigns(:job))
  end

  test "should destroy job if admin" do
    sign_in users(:admin)
    assert_difference('Job.count', -1) do
      delete :destroy, id: @job
    end

    assert_redirected_to jobs_path
  end

  test "should not create new job if not admin" do
    sign_in users(:regular)
    assert_no_difference('Job.count') do
      post :create, job: jobs(:one)
    end
    assert_redirected_to jobs_path
  end

  test "should not update job if not admin" do
    sign_in users(:regular)
    patch :update, id: @job, job: jobs(:one)
    assert_redirected_to jobs_path
  end

  test "should not destroy job if not admin" do
    sign_in users(:regular)
    assert_no_difference('Job.count') do
      delete :destroy, id: @job
    end
    assert_redirected_to jobs_path
  end

  test "should not get edit if not admin" do
    sign_in users(:regular)
    post :edit, id: @job
    assert_redirected_to jobs_path
  end
end