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
  
  def send_when_create(users,movie,i)
    #SMTP経由のメール1通で送れる最大宛先数は99件
    max_send_number = 99
    @new_movie = movie
    if i == 0
      mail to: 'test@example.com', subject:  'セレブエンジニアサロンの新規動画について',
      bcc: users.first(max_send_number).map{|u| u.email}
    else
      mail to: 'test@example.com', subject:  'セレブエンジニアサロンの新規動画について',
      bcc: users[(max_send_number*i)..(max_send_number*(i+1))-1].map{|u| u.email}
    end
  end
  
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワード再設定"
  end
end