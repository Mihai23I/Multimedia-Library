class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Esti logat'
      log_in(user)
      params[:session][:remember] == '1' ? remember(user) : forget(user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Informatiile oferite sunt gresite'
      render 'new'
    end
  end

  def destroy
    flash[:success] = 'Ai iesit din cont'
    log_out if logged_in?
    redirect_to root_url
  end
end
