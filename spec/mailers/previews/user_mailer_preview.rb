# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def scheduled_visit_email_preview
    UserMailer.scheduled_visit_email(User.first)
  end
end
