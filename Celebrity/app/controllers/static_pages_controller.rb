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
    @feedbacks = @user.feedbacks.build(feedback: params[:impression], movie_id: 1)

    # saveする
    if @feedbacks.save
    
    render 'layouts/_form'    
    # ボタンを押下したらdisabledかつ感想送信完了かつメッセージ通知を出したい
    # flash[:success] = "登録完了したのでリダイレクトしました"
    # redirect_to '/progate'
    end
    
  end
  
  private
    def feedback_params
      params.require(:feedback).permit(:impression, movie_id)
    end
  

end
