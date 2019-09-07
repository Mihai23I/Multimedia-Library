require 'test_helper'

class Administrator::PhysicalItemsControllerTest < ActionController::TestCase
  setup do
    @physical_item = physical_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_item" do
    assert_difference('PhysicalItem.count') do
      post :create, physical_item: { category: @physical_item.category, id: @physical_item.id, item_id: @physical_item.item_id, location_id: @physical_item.location_id }
    end

    assert_redirected_to administrator_physical_item_path(assigns(:physical_item))
  end

  test "should show physical_item" do
    get :show, id: @physical_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_item
    assert_response :success
  end

  test "should update physical_item" do
    patch :update, id: @physical_item, physical_item: { category: @physical_item.category, id: @physical_item.id, item_id: @physical_item.item_id, location_id: @physical_item.location_id }
    assert_redirected_to administrator_physical_item_path(assigns(:physical_item))
  end

  test "should destroy physical_item" do
    assert_difference('PhysicalItem.count', -1) do
      delete :destroy, id: @physical_item
    end

    assert_redirected_to administrator_physical_items_path
  end
end
