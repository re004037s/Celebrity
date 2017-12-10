class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.alert_completion_date.subject
  #
  def alert_completion_date(user,no_complete_task)
    
    @user = user

#user name
    @user_name = @user.name

#task name
    @task_name = no_complete_task

#宛先アドレス
    mail to: @user.email
  end
end
