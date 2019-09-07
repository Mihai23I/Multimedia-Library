require 'test_helper'

class Administrator::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { activated: @user.activated, activated_at: @user.activated_at, admin: @user.admin, city_id: @user.city_id, client_id: @user.client_id, email: @user.email, id: @user.id }
    end

    assert_redirected_to administrator_user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { activated: @user.activated, activated_at: @user.activated_at, admin: @user.admin, city_id: @user.city_id, client_id: @user.client_id, email: @user.email, id: @user.id }
    assert_redirected_to administrator_user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to administrator_users_path
  end
end
