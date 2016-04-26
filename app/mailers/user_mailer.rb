class UserMailer < ApplicationMailer
  default from: "moto.hoosier@gmail.com"

  def scheduled_visit_email(user)
    @user = user
    mail(to: @user.email, subject: "Your Scheduled Visit")
  end

  def new_user_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to MaxFund")
  end
end
