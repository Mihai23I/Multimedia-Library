# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :not_logged_in, only: %i[new, create]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        flash[:success] = 'Esti logat'
        log_in(user)
        params[:session][:remember] == '1' ? remember(user) : forget(user)
        redirect_back_or edit_user_path(current_user)
      else
        flash.now[:danger] = "Contul nu este activat. Verifica adresa de mail!"
        redirect_to root_url
      end
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

  private

  def not_logged_in
    return unless logged_in?

    flash[:danger] = "Nu ai acces la acea pagina"
    redirect_to root_url
  end
end
