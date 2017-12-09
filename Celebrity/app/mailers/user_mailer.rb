class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.alert_completion_date.subject
  #
  def alert_completion_date

#user name
    @user_name = "中野"

#task name
    @task_name = "HTML&CSS３章"

#宛先アドレス
    mail to: "to@example.org"
  end
end
