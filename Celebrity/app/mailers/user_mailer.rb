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
  
  def new_movie_add(user,)
    
    @user = user		
 		
    #user name		
    @user_name = @user.nickname	
    
    #new movies
    @new_movies = add_new_movies
    
    #宛先アドレス		 
    mail to: @user.email, subject: "セレブエンジニアサロン新着動画"	
    
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