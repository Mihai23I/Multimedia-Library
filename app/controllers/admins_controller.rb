class AdminsController < ApplicationController
  before_action :check_admin

  private

  def check_admin
    return true if admin?

    flash[:danger] = 'Nu ai acces la acea pagina'
    redirect_to root_url
  end
end
