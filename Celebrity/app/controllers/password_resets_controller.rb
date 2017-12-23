class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end
  
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:into] = "パスワード再設定用メールが送信されました"
      redirect_to root_url
    else
      flash.now[:danger] = "メールアドレスが見つかりません"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if params[:user][:password].empty?                  # 空文字になっていないか？
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update_attributes(user_params)          # 新しいPWが正しければ、更新する
      log_in @user
      flash[:success] = "パスワードが更新されました"
      redirect_to @user
    else
      render 'edit'                                     # 無効なPWを失敗させる
    end
  end

  private
    
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
    
    # beforeフィルタ
    
    def get_user
      @user = User.find_by(email: params[:email])
    end
    
    # 正しいユーザーかどうか確認する
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
    
    # トークンが期限切れかどうか確認
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "パスワード再設定時間切れ"
        redirect_to new_password_reset_url
      end
    end
end