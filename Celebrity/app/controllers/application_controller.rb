class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  
  
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
  
    # 他のエラーハンドリングでキャッチできなかった場合に
  # 500 Internal Server Error(システムエラー)を発生させる
  # NOTE: rescue_from は下から評価される
  rescue_from Exception, with: :handle_500 unless Rails.env.development?

  # 例外に合わせたエラーハンドリング
  # 404 Not Found リソースが見つからない。アクセス権がない場合にも使用される
  rescue_from ActionController::RoutingError, with: :handle_404 unless Rails.env.development?
  rescue_from ActiveRecord::RecordNotFound,   with: :handle_404 unless Rails.env.development?


  # エラーハンドリング処理
  def handle_500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception

    if request.xhr?
      # Ajaxのための処理
      render json: { error: '500 error' }, status: 500
    else
      render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
    end
  end

  def handle_404(exception = nil)
    logger.info "Rendering 404 with exception: #{exception.message}" if exception

    if request.xhr?
      # Ajaxのための処理
      render json: { error: '404 error' }, status: 404
    else
      render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
    end
  end
  
  
end
