class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :existence_user, only: [:show, :edit, :update]
  
  def index
    @users = User.page(params[:page])
  end
  
  def show
    @categories = MovieCategory.where(must_view: true).order('sort_order')
  end
  
  def new
    @user = User.new
    redirect_to root_url if logged_in?
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 作成ユーザに紐付く進捗テーブルレコードの作成（nil回避）
      HtmlCssStatus.create(user_id: @user.id)
      JavascriptStatus.create(user_id: @user.id)
      RubyStatus.create(user_id: @user.id)
      RubyonrailsStatus.create(user_id: @user.id)
      RailstutorialStatus.create(user_id: @user.id)
      UserMovieStatus.create(user_id: @user.id)
      
      log_in @user
      flash[:success] = 'Welcome to the セレブエンジニアサロン'
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザ情報を更新しました'
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).update_attribute(:existence, false)
    flash[:success] = 'ユーザを削除しました'
    redirect_to users_path
  end
  
  # TODO WIP
  # @user = User.find(params[:id])でidが取得できません(routesとアクションの構成が正しくない？)
  # upload_fileの中身を確認できない。byebugを挿入するとサイトを読み込めなくなります
  # postgreSQLでusers tableの値を取得、確認しようとしましたが、接続がうまくできませんでした。
  
  def edit_profile_pic
    @user = User.find(params[:id])
    upload_file = user_params[:file]
    
    user = {}
    if upload_file != nil 
      user[:filename] = upload_file.original_filename
      user[:file] = upload_file.read
    end 
    
    @user.update_attributes(profile_pic_name: user[:filename], profile_pic: user[:file])
    
    if @user.save
      flash[:success] = '画像を保存しました！'
      redirect_to current_user 
    else
      flash[:error] = 'fail！'
      redirect_to current_user
    end 
  end
    
  
  private
  
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :portfolio_path, :github_path, :profile_pic_name, :profile_pic)
    end
    
    # ログイン済み or 管理ユーザであれば true を返す
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user) || current_user.admin
    end
    
    # アクセスしようとしているページが削除ユーザのものである場合はルートURLへリダイレクト
    def existence_user
      @user = User.find(params[:id])
      redirect_to root_url unless existence_user?(@user)
    end
    
    


end
