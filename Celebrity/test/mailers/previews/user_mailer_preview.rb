# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/alert_completion_date
  def alert_completion_date
    UserMailer.alert_completion_date
  end

end
