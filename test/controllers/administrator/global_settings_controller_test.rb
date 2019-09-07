require 'test_helper'

class Administrator::GlobalSettingsControllerTest < ActionController::TestCase
  setup do
    @global_setting = global_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:global_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create global_setting" do
    assert_difference('GlobalSetting.count') do
      post :create, global_setting: { application_name: @global_setting.application_name, maximum_days_for_burrowing: @global_setting.maximum_days_for_burrowing, maximum_items_per_client: @global_setting.maximum_items_per_client }
    end

    assert_redirected_to administrator_global_setting_path(assigns(:global_setting))
  end

  test "should show global_setting" do
    get :show, id: @global_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @global_setting
    assert_response :success
  end

  test "should update global_setting" do
    patch :update, id: @global_setting, global_setting: { application_name: @global_setting.application_name, maximum_days_for_burrowing: @global_setting.maximum_days_for_burrowing, maximum_items_per_client: @global_setting.maximum_items_per_client }
    assert_redirected_to administrator_global_setting_path(assigns(:global_setting))
  end

  test "should destroy global_setting" do
    assert_difference('GlobalSetting.count', -1) do
      delete :destroy, id: @global_setting
    end

    assert_redirected_to administrator_global_settings_path
  end
end
