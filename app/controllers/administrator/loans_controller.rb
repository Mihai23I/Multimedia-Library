class Administrator::LoansController < AdminsController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /administrator/loans
  def index
    @loans = Loan.all
  end

  # GET /administrator/loans/1
  def show
  end

  # GET /administrator/loans/new
  def new
    @loan = Loan.new
  end

  # GET /administrator/loans/1/edit
  def edit
  end

  # POST /administrator/loans
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      redirect_to [:administrator, @loan], notice: 'Loan was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/loans/1
  def update
    if @loan.update(loan_params)
      redirect_to [:administrator, @loan], notice: 'Loan was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/loans/1
  def destroy
    @loan.destroy
    redirect_to administrator_loans_url, notice: 'Loan was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def loan_params
      params.require(:loan).permit(:client_id, :physical_item_id, :burrow_date, :return_date, :status)
    end
end
