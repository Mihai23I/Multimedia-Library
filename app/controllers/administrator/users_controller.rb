class Administrator::UsersController < AdminsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /administrator/users
  def index
    @users = User.all
  end

  # GET /administrator/users/1
  def show
  end

  # GET /administrator/users/new
  def new
    @user = User.new
  end

  # GET /administrator/users/1/edit
  def edit
  end

  # POST /administrator/users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:administrator, @user], notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /administrator/users/1
  def update
    if @user.update(user_params)
      redirect_to [:administrator, @user], notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /administrator/users/1
  def destroy
    @user.destroy
    redirect_to administrator_users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :client_id, :email, :admin, :city_id, :activated, :activated_at)
    end
end
