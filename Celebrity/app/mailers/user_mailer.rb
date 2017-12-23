class UserMailer < ApplicationMailer
  def alert_completion_date(user,no_complete_tasks)
    
    @user = user

    #user name
    @user_name = @user.name

    #task names
    @task_names = no_complete_tasks

    #宛先アドレス
    mail to: @user.email, subject: "セレブエンジニアサロンのタスクについて"
  end
  
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

end