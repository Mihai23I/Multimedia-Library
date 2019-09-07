require 'test_helper'

class Administrator::ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { address: @client.address, id: @client.id, name: @client.name, other_information: @client.other_information, phone: @client.phone, unique_identifier_code: @client.unique_identifier_code }
    end

    assert_redirected_to administrator_client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { address: @client.address, id: @client.id, name: @client.name, other_information: @client.other_information, phone: @client.phone, unique_identifier_code: @client.unique_identifier_code }
    assert_redirected_to administrator_client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to administrator_clients_path
  end
end
