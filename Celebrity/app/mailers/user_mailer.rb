class UserMailer < ApplicationMailer

  def alert_completion_date(user, no_complete_tasks)
    @user = user
    @user_name  = @user.name
    @task_names = no_complete_tasks
    mail to: @user.email, subject: "セレブエンジニアサロンのタスクについて"
  end


  def send_when_create(users, movie)
    @new_movie = movie
    mail to: 'test@example.com', subject: 'セレブエンジニアサロンの新規動画について',bcc: users.map{|u| u.email}
  end


  # def account_activation(user)
  #   @user = user
  #   mail to: user.email, subject: "Account activation"
  # end

  def slack_invitation(user)
    @user = user
    @join_url  = 'https://join.slack.com/t/rails-tutorial-sprt/shared_invite/' \
                 'enQtNDQ3MzE1NTExNDU4LTM2MTIwNDU1NDhkNjMyNGQ5MzRmYTM2ZjZlNzJ' \
                 'kM2M4NTM3YjVkODMwNmQzZGMyMjI5NWQxMTgzNzg4NWUzZjY'
    @guide_url = 'https://get.slack.help/hc/ja/categories/200111606' \
                 '#u12513u12483u12475u12540u12472u12434u36865u20449u12539u25237u31295'

    mail to: @user.email, subject: "【重要】メンバー限定サポートチャンネルへご参加ください！"
  end


  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワード再設定"
  end
end