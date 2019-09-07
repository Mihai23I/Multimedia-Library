require 'test_helper'

class Administrator::CitiesControllerTest < ActionController::TestCase
  setup do
    @city = cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city" do
    assert_difference('City.count') do
      post :create, city: { coordinate_id: @city.coordinate_id, country: @city.country, id: @city.id, name: @city.name }
    end

    assert_redirected_to administrator_city_path(assigns(:city))
  end

  test "should show city" do
    get :show, id: @city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @city
    assert_response :success
  end

  test "should update city" do
    patch :update, id: @city, city: { coordinate_id: @city.coordinate_id, country: @city.country, id: @city.id, name: @city.name }
    assert_redirected_to administrator_city_path(assigns(:city))
  end

  test "should destroy city" do
    assert_difference('City.count', -1) do
      delete :destroy, id: @city
    end

    assert_redirected_to administrator_cities_path
  end
end
