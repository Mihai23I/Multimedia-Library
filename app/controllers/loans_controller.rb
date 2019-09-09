class LoansController < ApplicationController
  before_action :is_logged_in_user

  def index
    @loans = Loan.all.where(client_id: current_user.client.id).order(updated_at: :desc).page(params[:page])
  end

  def new
    @loan = Loan.new
    @physical_item = PhysicalItem.find(params[:physical_item_id])
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      flash[:success] = 'Cererea a fost realizata'
      redirect_to loans_path
    else
      redirect_to new_physical_item_loan_path(params[:loan][:physical_item_id])
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:client_id, :physical_item_id, :burrow_date, :return_date, :status)
  end

  def is_logged_in_user
    return if is_logged_in?
    store_location
    flash[:danger] = "Pentru a accesa acea pagina trebuie sa fi logat"
    redirect_to login_url
  end
end
