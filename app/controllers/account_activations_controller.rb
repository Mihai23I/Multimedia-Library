# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = 'Contul este activat!'
      redirect_to user
    else
      flash[:danger] = 'Link-ul de activare este invalid'
      redirect_to root_url
    end
  end
end
