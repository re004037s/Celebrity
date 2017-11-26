module SessionsHelper
  
  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # 渡されたユーザがログインしていれば true を返す
  def current_user?(user)
    user == current_user
  end

  # 現在ログイン中のユーザを返す (いる場合)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # ユーザがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  # 現在のユーザをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # 渡されたユーザが削除されていなければ true を返す
  def existence_user?(user)
    user.existence
  end
end
