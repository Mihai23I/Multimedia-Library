class Administrator::UsersController < AdminsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.order(updated_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:administrator, @user], notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to [:administrator, @user], notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to administrator_users_url, notice: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :client_id, :email, :admin, :city_id, :activated, :activated_at)
    end
end
