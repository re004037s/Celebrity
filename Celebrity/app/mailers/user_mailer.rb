class UserMailer < ApplicationMailer

  def alert_completion_date(user,no_complete_tasks)		
    		
    @user = user		
 		
    #user name		
    @user_name = @user.nickname		
  		  
    #task names		 
    @task_names = no_complete_tasks
  
    #宛先アドレス		 
    mail to: @user.email, subject: "セレブエンジニアサロンのタスクについて"		
  end
  
  def send_when_create(users,movie)
       @new_movie = movie
       #users.each do |user|
       #@user_name = user.nickname
       #@user_name = users.map{|u| u.nickname}
       mail to: 'test@example.com', subject:  'セレブエンジニアサロンの新規動画について',bcc: users.map{|u| u.email}
    #end
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