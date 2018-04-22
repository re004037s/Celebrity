class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  #before_action :check_guest_user(「このページは動作していません」のエラーになる)
  
  
  def logged_in_user
    unless logged_in?
      # flash[:danger] = 'ログインしてください'
      redirect_to login_url
    end
  end
  
  def admin_user
    return true if current_user.try(:admin)
    redirect_to root_url
  end
  
  def check_guest_user
    if guest_user?
     flash[:danger] = 'ゲストユーザーには閲覧権限がありません'
     redirect_to controller: 'skillsheets', action: 'index'
    end
  end
  
  # 画像データの取得
  def show_image
    model = params[:model].constantize.find(params[:id])
    send_data model[params[:column]], :type => 'image/jpg,image/jpeg,image/png,image/gif', :disposition => 'inline'
  end
end
