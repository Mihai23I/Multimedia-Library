require 'test_helper'

class Administrator::LoansControllerTest < ActionController::TestCase
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post :create, loan: { burrow_date: @loan.burrow_date, client_id: @loan.client_id, physical_item_id: @loan.physical_item_id, return_date: @loan.return_date, status: @loan.status }
    end

    assert_redirected_to administrator_loan_path(assigns(:loan))
  end

  test "should show loan" do
    get :show, id: @loan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan
    assert_response :success
  end

  test "should update loan" do
    patch :update, id: @loan, loan: { burrow_date: @loan.burrow_date, client_id: @loan.client_id, physical_item_id: @loan.physical_item_id, return_date: @loan.return_date, status: @loan.status }
    assert_redirected_to administrator_loan_path(assigns(:loan))
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete :destroy, id: @loan
    end

    assert_redirected_to administrator_loans_path
  end
end
