class LoansController < ApplicationController
  before_action :is_logged_in_user

  def index
  end

  def new
    @loan = Loan.new
    @physical_item = PhysicalItem.find(params[:physical_item_id])
  end

  def create
  end

  private

  def is_logged_in_user
    return if is_logged_in?
    store_location
    flash[:danger] = "Pentru a accesa acea pagina trebuie sa fi logat"
    redirect_to login_url
  end
end
