class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Activare cont"
  end

  def password_reset(user)
    @user = user
    @user.reset_token = User.new_token
    mail to: user.email, subject: "Recuperare parola"
  end
end
