class UserPasswordResetsController < ApplicationController
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      UserMailer.password_reset(@user).deliver_now
      flash[:info] = 'Emailul a fost trimis'
      redirect_to root_url
    else
      flash.now[:danger] = 'Adresa de mail nu a fost gasita'
      render 'new'
    end
  end

  def edit; end

  def update
    if password_blank?
      flash.now[:danger] = "Trebuie sa completezi parola"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Parola a fost resetata"
      redirect_to @user
    else
      flash.now[:danger] = "Parola introdusa nu e corecta"
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Cererea a expirat."
      redirect_to new_password_reset_url
    end
  end

    # Confirms a valid user.
    def valid_user
      @user = User.find_by(email: params[:email])
      return if @user&.authenticated?(:reset, params[:id])

      flash[:danger] = "Cererea a esuat."
      redirect_to root_url
    end
end
