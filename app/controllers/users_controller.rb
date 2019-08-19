class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update]
  before_action :correct_user, only: %i[edit update]
  # before_action :not_logged_in, only: %i[create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Inregistrarea a functionat'
      redirect_to root_url
    else
      flash.now[:danger] = 'Inregistrarea nu a functionat'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to edit_user_path(current_user)
    else
      flash.now[:danger] = 'Modificarea nu a functionat'
      render 'edit'
    end
  end

  private

  # def not_logged_in
  #   return unless logged_in?
  #
  #   flash[:danger] = "Nu ai acces la acea pagina"
  #   redirect_to root_url
  # end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = "Pentru a accesa acea pagina trebuie sa fi logat"
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone, :city)
  end
end
