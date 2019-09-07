class Administrator::LoansController < AdminsController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  def index
    @q = Loan.ransack(params[:q])
    @loans = @q.result.order(updated_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @loan = Loan.new
  end

  def edit
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      flash[:success] = 'Loan was successfully created.'
      redirect_to [:administrator, @loan]
    else
      render action: 'new'
    end
  end

  def update
    if @loan.update(loan_params)
      flash[:success] = 'Loan was successfully updated.'
      redirect_to [:administrator, @loan]
    else
      render action: 'edit'
    end
  end

  def destroy
    @loan.destroy
    redirect_to administrator_loans_url, notice: 'Loan was successfully destroyed.'
  end

  private
    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:client_id, :physical_item_id, :burrow_date, :return_date, :status)
    end
end
