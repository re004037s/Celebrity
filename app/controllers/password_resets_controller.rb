class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user.try(:existence) #existanceがtureかfalseで判断
      if @user
        @user.create_reset_digest
        @user.send_password_reset_email
   
        flash[:info] = "パスワード再設定用のメールが送信されました。"
        redirect_to login_url
      else
        flash.now[:danger] = "メールアドレスが無効です。"
        render 'new'
      end
    else
      flash.now[:info] = "ユーザが存在しません" #elseの場合 "ユーザが存在しません。" と表示する
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if params[:user][:password].empty?               
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update_attributes(user_params)  
      log_in @user
      flash[:success] = "パスワードが再設定されました。"
      redirect_to @user
    else
      render 'edit'           
    end
  end
  
private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end


    def get_user
      @user = User.find_by(email: params[:email])
    end

    # 正しいユーザーかどうか確認する
    def valid_user
      unless (@user  &&  @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
    # トークンが期限切れかどうか確認する
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "パスワード再設定用の認証トークンが期限切れです。"
        redirect_to new_password_reset_url
      end
    end
end
