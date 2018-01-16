class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  
  def new
    redirect_to root_url if logged_in?
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && existence_user?(user) && user.authenticate(params[:session][:password])
      log_in user
      
      # ログインユーザに紐付く進捗テーブルレコードの作成（nil回避）
      HtmlCssStatus.create(user_id: user.id)       if user.html_css_status.nil?
      JavascriptStatus.create(user_id: user.id)    if user.javascript_status.nil?
      RubyStatus.create(user_id: user.id)          if user.ruby_status.nil?
      RubyonrailsStatus.create(user_id: user.id)   if user.rubyonrails_status.nil?
      RailstutorialStatus.create(user_id: user.id) if user.railstutorial_status.nil?
      UserMovieStatus.create(user_id: user.id) if user.user_movie_status.nil?
      
      redirect_to root_url
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが不正です'
      render 'new'
    end
  end
  
  def destroy
    log_out
    flash[:success] = 'ログアウトしました'
    redirect_to login_url
  end
  
end