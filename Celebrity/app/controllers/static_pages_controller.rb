class StaticPagesController < ApplicationController
  before_action :logged_in_user
  
  def home
  end

  def about
  end
  
  def help
  end
  
  def contact
  end
  
  def qa
  end
  
  def progate
  
  end
  
  def feedback
    # user_id(current_user_id) とmovie_idを取得する
    @user = User.find_by(id:1)
    @feedbacks = @user.feedbacks.build(feedback: params[:impression], movie_id: '1')

    # saveする
    @feedbacks.save
    
    # 確認のためにリダイレクトさせているが
    # ボタンを押下したらdisabledかつ感想送信完了かつメッセージ通知を出したい
    redirect_to '/'
    flash[:notice] = "登録完了したのでリダイレクトしました"

  end
  
end
