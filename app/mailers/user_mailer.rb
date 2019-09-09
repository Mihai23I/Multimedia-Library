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

  def request_loan(user, loan)
    @user = user
    @loan = loan
    mail to: user.email, subject: "Ati realizat o cerere de imprumut"
  end
end
