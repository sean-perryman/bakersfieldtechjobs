require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index if logged in" do
    sign_in users(:regular)
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    sign_in users(:admin)
    get :new
    assert_response :success
  end

  test "should create company if admin" do
    sign_in users(:admin)
    assert_difference('Company.count') do
      post :create, company: companies(:one)
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company if logged in" do
    sign_in users(:regular)
    get :show, id: @company
    assert_response :success
  end

  test "should get edit if admin" do
    sign_in users(:admin)
    get :edit, id: @company
    assert_response :success
  end

  test "should update company if admin" do
    sign_in users(:admin)
    patch :update, id: @company, company: companies(:one)
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company if admin" do
    sign_in users(:admin)
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
