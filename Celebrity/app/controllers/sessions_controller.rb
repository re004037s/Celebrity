class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && existence_user?(user) && user.authenticate(params[:session][:password])
      log_in user
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